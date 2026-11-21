# Fish

[← Index](../README.en.md) · [Polski](fish.md) · English

Shared shell configuration for NixOS and macOS.

## Table of contents

- [Where the config lives](#where-the-config-lives)
- [Plugins](#plugins)
- [fzf](#fzf)
- [zoxide](#zoxide)
- [Fisher](#fisher)
- [Adding a custom plugin](#adding-a-custom-plugin)
- [macOS](#macos)
- [Verification](#verification)

## Where the config lives

| File | Role |
|---|---|
| `hm-modules/shared/fish.nix` | `programs.fish`, plugins, zoxide, fzf |
| `hosts/thinkpad/home.nix` | imports `hm-modules/linux` and the shared base |
| `hosts/mac-mini/home.nix` | imports `hm-modules/darwin` and the shared base |
| `hm-modules/darwin/default.nix` | `loginShellInit` with Homebrew and system PATH |
| `hm-modules/darwin/ghostty.nix` | Ghostty shell integration |

Home Manager generates `~/.config/fish/config.fish` and plugin files under
`~/.config/fish/conf.d/`.

## Plugins

| Plugin | Source | Role |
|---|---|---|
| `hydro` | `pkgs.fishPlugins.hydro` | async Git-aware prompt |
| `fzf.fish` | `pkgs.fishPlugins.fzf-fish` | fzf key bindings: Ctrl+R, Ctrl+T, Alt+C |
| `autopair` | `pkgs.fishPlugins.autopair` | automatic bracket and quote pairing |
| `done` | `pkgs.fishPlugins.done` | notification after long commands |

All of them live in `hm-modules/shared/fish.nix`, so they work on both hosts.

## fzf

`fzf.fish` installs its own key bindings. Home Manager's built-in fish
integration is therefore disabled:

```nix
programs.fzf = {
  enable = true;
  enableFishIntegration = false;
};
```

Enabling both would duplicate shortcuts and could conflict.

`fzf.fish` also uses `fd` and `bat`; both are in
`hm-modules/shared/packages.nix`.

## zoxide

```nix
programs.zoxide.enable = true;
```

Home Manager installs `zoxide` and adds fish initialization. Homebrew has a
separate `zoxide` copy — remove it if you want to avoid a duplicate in `PATH`:

```console
brew uninstall zoxide
```

## Fisher

Fisher is not used. Home Manager installs plugins itself, so fisher would be a
redundant second manager. On a Mac with an existing fisher setup, remove the
plugins before the first `darwin-rebuild`:

```console
fisher remove jorgebucaran/hydro
fisher remove patrickf1/fzf.fish
fisher remove jorgebucaran/autopair.fish
fisher remove franciscolourenco/done
fisher remove jorgebucaran/fisher
```

After that, `fisher list` should be empty (or the command should not exist).

## Adding a custom plugin

If the plugin is in nixpkgs:

```nix
{
  name = "name";
  src = pkgs.fishPlugins.name.src;
}
```

If it is not, use `fetchFromGitHub`:

```nix
{
  name = "my-plugin";
  src = pkgs.fetchFromGitHub {
    owner = "author";
    repo = "my-plugin";
    rev = "0123456789abcdef";
    hash = "sha256-...";
  };
}
```

Important: `src` must point to a directory with `conf.d/`, `functions/` and
`completions/` — not to the output of `buildFishPlugin`.

## macOS

- Fish is the login shell: `programs.fish.enable = true` in
  `hosts/mac-mini/configuration.nix` adds it to `/etc/shells`.
- Set it once after the first switch:

  ```console
  chsh -s /run/current-system/sw/bin/fish
  ```

- `hm-modules/darwin/default.nix` adds `/opt/homebrew/bin` and
  `/run/current-system/sw/bin` to `PATH`.
- `homebrew.enableFishIntegration = true` adds Homebrew integration.
- Ghostty has its own fish integration via
  `programs.ghostty.enableFishIntegration`.

## Verification

```console
fish --version
functions -q fish_prompt
functions -q fzf_file
zoxide --version
```

After removing fisher:

```console
fisher list
```

It should be empty, or the command should not exist.
