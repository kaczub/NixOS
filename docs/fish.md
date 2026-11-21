# Fish

[← Index](../README.md) · **Polski** · [English](fish.en.md)

Wspólna konfiguracja powłoki dla NixOS i macOS.

## Spis treści

- [Gdzie jest konfiguracja](#gdzie-jest-konfiguracja)
- [Pluginy](#pluginy)
- [fzf](#fzf)
- [zoxide](#zoxide)
- [Fisher](#fisher)
- [Dodawanie własnego pluginu](#dodawanie-własnego-pluginu)
- [macOS](#macos)
- [Weryfikacja](#weryfikacja)

## Gdzie jest konfiguracja

| Plik | Rola |
|---|---|
| `hm-modules/shared/fish.nix` | `programs.fish`, pluginy, zoxide, fzf |
| `hosts/thinkpad/home.nix` | importuje `hm-modules/linux` i wspólną bazę |
| `hosts/mac-mini/home.nix` | importuje `hm-modules/darwin` i wspólną bazę |
| `hm-modules/darwin/default.nix` | `loginShellInit` z PATH dla Homebrew i profilu systemowego |
| `hm-modules/darwin/ghostty.nix` | integracja Ghostty z fish |

Home Manager generuje `~/.config/fish/config.fish` oraz pliki pluginów
w `~/.config/fish/conf.d/`.

## Pluginy

| Plugin | Źródło | Rola |
|---|---|---|
| `hydro` | `pkgs.fishPlugins.hydro` | prompt z asynchronicznym statusem gita |
| `fzf.fish` | `pkgs.fishPlugins.fzf-fish` | keybindingi fzf: Ctrl+R, Ctrl+T, Alt+C |
| `autopair` | `pkgs.fishPlugins.autopair` | automatyczne domykanie nawiasów i cudzysłowów |
| `done` | `pkgs.fishPlugins.done` | powiadomienie po długim poleceniu |

Wszystkie są w `hm-modules/shared/fish.nix`, więc działają na obu hostach.

## fzf

`fzf.fish` sam ustawia keybindingi. Dlatego wbudowana integracja Home Managera
jest wyłączona:

```nix
programs.fzf = {
  enable = true;
  enableFishIntegration = false;
};
```

Włączenie obu naraz dublowałoby skróty i mogło powodować konflikty.

`fzf.fish` korzysta też z `fd` i `bat` — oba są w `hm-modules/shared/packages.nix`.

## zoxide

```nix
programs.zoxide.enable = true;
```

Home Manager instaluje `zoxide` i dopisuje inicjalizację do fisha. Brew ma
osobną kopię `zoxide` — jeśli chcesz uniknąć duplikatu w `PATH`, usuń ją:

```console
brew uninstall zoxide
```

## Fisher

Fisher nie jest używany. Home Manager sam instaluje pluginy, więc fisher jest
zbędnym drugim menedżerem. Na Macu z istniejącym fisherem usuń pluginy przed
pierwszym `darwin-rebuild`:

```console
fisher remove jorgebucaran/hydro
fisher remove patrickf1/fzf.fish
fisher remove jorgebucaran/autopair.fish
fisher remove franciscolourenco/done
fisher remove jorgebucaran/fisher
```

Po tym `fisher list` nie powinien już nic zwracać (albo komenda nie będzie
istnieć).

## Dodawanie własnego pluginu

Jeśli plugin jest w nixpkgs:

```nix
{
  name = "nazwa";
  src = pkgs.fishPlugins.nazwa.src;
}
```

Jeśli go nie ma, użyj `fetchFromGitHub`:

```nix
{
  name = "moj-plugin";
  src = pkgs.fetchFromGitHub {
    owner = "autor";
    repo = "moj-plugin";
    rev = "0123456789abcdef";
    hash = "sha256-...";
  };
}
```

Ważne: `src` ma wskazywać katalog ze strukturą `conf.d/`, `functions/`,
`completions/` — a nie wynik `buildFishPlugin`.

## macOS

- Fish jest powłoką logowania: `programs.fish.enable = true` w
  `hosts/mac-mini/configuration.nix` dodaje go do `/etc/shells`.
- Po pierwszym switchu ustaw go raz ręcznie:

  ```console
  chsh -s /run/current-system/sw/bin/fish
  ```

- `hm-modules/darwin/default.nix` dodaje do PATH `/opt/homebrew/bin`
  i `/run/current-system/sw/bin`.
- `homebrew.enableFishIntegration = true` dodaje integrację Homebrew.
- Ghostty ma własną integrację fish przez `programs.ghostty.enableFishIntegration`.

## Weryfikacja

```console
fish --version
functions -q fish_prompt
functions -q fzf_file
zoxide --version
```

Po usunięciu fishera:

```console
fisher list
```

Powinno być puste lub komenda nie powinna istnieć.
