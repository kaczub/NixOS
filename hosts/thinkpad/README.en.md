# ThinkPad T490 — NixOS

[← Index](../../README.en.md) · [Polski](README.md) · English

ThinkPad T490 running NixOS `nixos-unstable`, niri as the compositor and
Noctalia as the shell. The configuration uses the shared Home Manager and
`hosts/shared` modules.

## Table of contents

- [Host configuration](#host-configuration)
- [Installation and reinstall](#installation-and-reinstall)
- [Desktop: niri + Noctalia](#desktop-niri--noctalia)
- [Wallpapers](#wallpapers)
- [Keyboard shortcuts](#keyboard-shortcuts)
- [Hardware and power](#hardware-and-power)
- [Maintenance](#maintenance)
- [Troubleshooting](#troubleshooting)
- [Links](#links)

## Host configuration

| File | Role |
|---|---|
| `hosts/thinkpad/configuration.nix` | entry point: imports, hostname, `stateVersion` |
| `hosts/thinkpad/home.nix` | HM: `hm-modules/linux` + Linux home directory |
| `hosts/thinkpad/hardware.nix` | Intel GPU, fwupd, fstrim, zram, Bluetooth, UPower |
| `hosts/thinkpad/hardware-configuration.nix` | generated hardware config |
| `hosts/thinkpad/disko.nix` | target LUKS + btrfs layout |
| `hosts/shared/system.nix` | boot, network, Tailscale, Nix, GC |
| `hosts/shared/users.nix` | user account, system packages |
| `hosts/shared/desktop.nix` | niri, Noctalia, greeter, audio, locale, Steam |

Home Manager module split:

- `hm-modules/shared` — fish, git, direnv, neovim, Zed, CLI.
- `hm-modules/linux` — niri, Noctalia, GTK/dconf, XDG, GUI packages.
- `hm-modules/darwin` — not imported on this host.

## Installation and reinstall

The current system uses an existing unencrypted btrfs. `disko.nix` describes
the target layout:

- `nvme0n1p1` — 1G, vfat, `/boot` (ESP),
- `nvme0n1p2` — LUKS → btrfs,
- `home` and `nix` subvolumes.

Full procedure with backup, `disko` and mounting:
[INSTALL.en.md](INSTALL.en.md).

> `disko` in `destroy,format,mount` mode irreversibly wipes the disk.

## Desktop: niri + Noctalia

niri is the Wayland compositor and Noctalia is the shell: panel, launcher,
notifications and lockscreen.

Noctalia configuration has three layers:

| Layer | File | Priority |
|---|---|---|
| Base config from Nix | `programs.noctalia.settings` → `~/.config/noctalia/config.toml` | lowest |
| GUI snapshot in git | `hm-modules/linux/noctalia/gui.toml` → `~/.config/noctalia/gui.toml` | medium |
| Current GUI overrides | `~/.local/state/noctalia/settings.toml` | highest |

After changing settings in the GUI, save the snapshot:

```console
make noctalia-export
git diff hm-modules/linux/noctalia/gui.toml
```

Script: [`scripts/noctalia-export.sh`](../../scripts/noctalia-export.sh).

Important niri files:

- `hm-modules/linux/niri/input.nix` — keyboard and mouse,
- `hm-modules/linux/niri/layout.nix` — gaps, border, blur,
- `hm-modules/linux/niri/binds.nix` — shortcuts,
- `hm-modules/linux/niri/outputs.nix` — monitors,
- `hm-modules/linux/niri/default.nix` — window rules and Noctalia palette include.

## Wallpapers

[revaljonathan/wallpapers](https://github.com/revaljonathan/wallpapers)

> User directories are now in English: `~/Downloads`, `~/Documents`,
> `~/Pictures`, `~/Videos`, `~/Music`. The old Polish directories are not
> moved automatically — move their contents manually.

## Keyboard shortcuts

`Mod` = Super. Full list: [`hm-modules/linux/niri/binds.nix`](../../hm-modules/linux/niri/binds.nix).

<details>
<summary>Launching and Noctalia</summary>

| Shortcut | Action |
|---|---|
| `Mod+T` | terminal (kitty) |
| `Mod+Space` | Noctalia launcher |
| `Mod+E` | files (Nautilus) |
| `Mod+W` | Brave Origin |
| `Mod+S` | Spotify |
| `Mod+P` | session / power menu |
| `Mod+Alt+K` | calendar |
| `Mod+Alt+L` | lockscreen |
| `Mod+Shift+A` | audio |
| `Mod+Shift+B` | Bluetooth |
| `Mod+Shift+D` | dark / light |
| `Mod+Shift+M` | media |
| `Mod+Shift+N` | notifications |
| `Mod+Shift+P` | power / battery |
| `Mod+Shift+S` | Noctalia settings |
| `Mod+Shift+V` | clipboard |
| `Mod+Shift+W` | wallpapers |
| `Mod+Shift+Y` | weather |
| `Mod+Shift+Print` | region screenshot |
| `Mod+Ctrl+Print` | window screenshot |

</details>

<details>
<summary>Windows and workspaces</summary>

| Shortcut | Action |
|---|---|
| `Mod+Q` | close window |
| `Mod+Shift+E` | quit niri |
| `Mod+Left/Right/Up/Down` | focus |
| `Mod+H/J/K/L` | focus (Vim) |
| `Mod+Ctrl+Left/Right/Up/Down` | move window / column |
| `Mod+Shift+Left/Right/Up/Down` | focus monitor |
| `Mod+Shift+Ctrl+...` | move column to monitor |
| `Mod+1…9` | workspace |
| `Mod+Ctrl+1…9` | move column to workspace |
| `Mod+U` / `Mod+I` | workspace down / up |
| `Mod+Page_Down` / `Mod+Page_Up` | workspace down / up |
| `Mod+F` | maximize column |
| `Mod+Shift+F` | fullscreen |
| `Mod+V` | toggle floating |
| `Mod+Shift+Space` | toggle floating (alias) |
| `Mod+Alt+V` | focus floating ↔ tiling |
| `Mod+R` | resize column |
| `Mod+Minus` / `Mod+Equal` | width −10% / +10% |
| `Mod+Shift+Minus` / `Mod+Shift+Equal` | height −10% / +10% |
| `Mod+C` | center column |
| `Mod+Tab` | tabbed mode |
| `Mod+O` | overview |
| `Mod+Shift+Slash` | shortcut overview |
| `Print` | niri screenshot |

</details>

<details>
<summary>Media</summary>

| Shortcut | Action |
|---|---|
| `XF86AudioMicMute` | mute microphone |
| `XF86AudioMute` | mute |
| `XF86AudioRaiseVolume` / `LowerVolume` | volume |
| `XF86MonBrightnessUp` / `Down` | brightness |

</details>

## Hardware and power

- Intel GPU: `hardware.graphics` + `intel-media-driver`,
  `intel-vaapi-driver`, `intel-compute-runtime-legacy1` (VA-API, OpenCL).
- `zramSwap` instead of disk swap.
- Weekly `fstrim`.
- `fwupd` for firmware through LVFS.
- Bluetooth, UPower and `power-profiles-daemon`.
- Fingerprint and `fprintd` are not used.

## Maintenance

```console
make update        # nixos-rebuild switch
make test          # nixos-rebuild test
make check         # nix flake check --no-build
make fmt           # alejandra
make clean         # system and user GC
make noctalia-export
```

GC is also configured in `hosts/shared/system.nix` (`nix.gc`, weekly, older
than 7 days).

## Troubleshooting

**Kitty does not use my font / the config is a symlink.**
`hm-modules/linux/kitty.nix` appends `include font.conf` only to a regular
file. If `~/.config/kitty/kitty.conf` is a symlink, activation prints a
warning — remove the symlink and switch again.

**Noctalia does not refresh colors.**
Check that `enable_builtin_templates = true` is set in
`hm-modules/linux/noctalia/default.nix`, then export the snapshot.

**A change did not apply.**
`sudo nixos-rebuild switch --flake .#thinkpad` prints the evaluation error.
Quick check without building:

```console
nix flake check --no-build
```

## Links

- [niri wiki](https://yalter.github.io/niri/)
- [Noctalia docs](https://docs.noctalia.dev/)
- [disko](https://github.com/nix-community/disko)
- [NixOS options](https://search.nixos.org/options)
