# NixOS — pełna konfiguracja

Przegląd wszystkich plików konfiguracyjnych projektu `/home/kamil/nixos`.
Stan na 2026-08-26 (z usuniętym firefoxem).

## Drzewo plików

```text
NIXOS FLAKE — /home/kamil/nixos
================================

[Drzewo plików]
├── flake.nix
├── flake.lock               (auto-generowany, pominięty)
├── home.nix
├── Makefile
├── hm-modules/
│   ├── default.nix
│   ├── apps/
│   │   ├── ghostty.nix
│   │   └── brave.nix
│   ├── core/
│   │   ├── fish.nix
│   │   ├── git.nix
│   │   ├── dirs.nix
│   │   └── neovim.nix
│   └── desktop/
│       ├── default.nix
│       ├── cherry-blossom.png      (obrazek dla stylix)
│       ├── stylix/default.nix
│       ├── noctalia/default.nix
│       └── hyprland/
│           ├── default.nix
│           ├── hyprland.lua
│           └── lua/
│               ├── autostart.lua
│               ├── general.lua
│               ├── input.lua
│               ├── keybinds.lua
│               ├── monitors.lua
│               ├── rules.lua
│               └── touchpad.lua
└── hosts/
    ├── shared/
    │   ├── desktop.nix
    │   ├── system.nix
    │   └── users.nix
    ├── thinkpad/
    │   ├── configuration.nix
    │   ├── hardware-configuration.nix
    │   └── hardware.nix
    └── vm-arm/
        └── configuration.nix
```

## Katalog główny

### `flake.nix`

```nix
{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    noctalia,
    stylix,
    ...
  }@inputs: {
      formatter =
        nixpkgs.lib.genAttrs
        [
          "x86_64-linux"
          "aarch64-linux"
        ]
        (system: nixpkgs.legacyPackages.${system}.alejandra);

      nixosConfigurations = {
        thinkpad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/thinkpad/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs;};
              home-manager.users.kamil = import ./home.nix;
            }
          ];
        };

        vm-arm = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/vm-arm/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs;};
              home-manager.users.kamil = import ./home.nix;
            }
          ];
        };
      };
    };
}
```

### `home.nix`

```nix
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
    inputs.stylix.homeModules.stylix
    ./hm-modules
  ];

  home = {
    username = "kamil";
    homeDirectory = "/home/kamil";
    stateVersion = "26.05";

    packages = with pkgs; [
      # Przeglądarka i Komunikacja
      discord

      # Multimedia i Grafika
      darktable
      spotify

      # Gry i Narzędzia
      lutris
      prismlauncher
      qbittorrent

      # Narzędzia CLI
      fastfetch
      android-tools

      # Edytory kodu i IDE
      vscode

      # Czcionki
      nerd-fonts.jetbrains-mono

      # lua
      lua
      lua-language-server
      stylua

      # fonts
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono

      kitty
    ];
  };

  fonts.fontconfig.enable = true;
}
```

### `Makefile`

```make
.PHONY: update clean news

update:
	sudo nixos-rebuild switch --flake .#thinkpad

clean:
	nix-collect-garbage -d

news:
	home-manager news --flake .
```

## `hm-modules/`

### `hm-modules/default.nix`

```nix
{...}: {
  imports = [
    ./core/fish.nix
    ./core/git.nix
    ./core/dirs.nix
    ./core/neovim.nix

    ./apps/ghostty.nix
    ./apps/brave.nix

    ./desktop
  ];
}
```

### `hm-modules/apps/ghostty.nix`

```nix
{...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
    };
  };
}
```

### `hm-modules/apps/brave.nix`

```nix
{...}: {
  programs.brave.enable = true;
}
```

### `hm-modules/core/fish.nix`

```nix
{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
}
```

### `hm-modules/core/git.nix`

```nix
{...}: {
  programs.git = {
    enable = true;
    settings.user.name = "kaczub";
    settings.user.email = "170130290+kaczub@users.noreply.github.com";
  };
}
```

### `hm-modules/core/dirs.nix`

```nix
{config, ...}: {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    download = "${config.home.homeDirectory}/Pobrane";
    documents = "${config.home.homeDirectory}/Dokumenty";
    pictures = "${config.home.homeDirectory}/Obrazy";
    videos = "${config.home.homeDirectory}/Filmy";
    music = "${config.home.homeDirectory}/Muzyka";
    templates = null;
    publicShare = null;
  };

  xdg.configFile."user-dirs.dirs".force = true;
}
```

### `hm-modules/core/neovim.nix`

```nix
{...}: {
  programs.neovim = {
    enable = true;

    extraConfig = ''
      set background=dark
    '';
  };
}
```

## `hm-modules/desktop/`

### `hm-modules/desktop/default.nix`

```nix
{...}: {
  imports = [
    ./hyprland
    ./noctalia
    ./stylix
  ];
}
```

### `hm-modules/desktop/stylix/default.nix`

```nix
{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../cherry-blossom.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "dark";
  };

  # Stylix writes qt5ct/qt6ct theme files; allow overwriting existing ones
  # instead of failing activation with "would be clobbered".
  xdg.configFile."qt5ct/qt5ct.conf".force = true;
  xdg.configFile."qt6ct/qt6ct.conf".force = true;
}
```

### `hm-modules/desktop/noctalia/default.nix`

```nix
{lib, ...}: {
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "custom";
        custom_palette = "stylix";
      };

      shell = {
        font_family = lib.mkForce "JetBrains Mono";
        settings_show_advanced = true;

        animation = {
          enabled = true;
          speed = 1.0;
        };

        panel = {
          transparency_mode = "soft";
          borders = true;
          shadow = true;
          launcher_placement = "floating";
          launcher_position = "center";
          control_center_placement = "attached";
        };
      };

      bar.default = {
        position = "top";
        enabled = true;
        reserve_space = true;
        thickness = 34;
        background_opacity = 0.92;

        start = [
          "launcher"
          "workspaces"
        ];

        center = [
          "clock"
        ];

        end = [
          "network"
          "bluetooth"
          "volume"
          "battery"
          "tray"
          "control-center"
          "session"
        ];
      };
    };
  };
}
```

## `hm-modules/desktop/hyprland/`

### `hm-modules/desktop/hyprland/default.nix`

```nix
{config, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # Use the Hyprland and XDPH packages from the NixOS module
    # (programs.hyprland.enable) instead of installing duplicates via HM.
    package = null;
    portalPackage = null;
  };

  xdg.configFile = {
    "hypr/hyprland.lua".source = ./hyprland.lua;
    "hypr/lua/monitors.lua".source = ./lua/monitors.lua;
    "hypr/lua/autostart.lua".source = ./lua/autostart.lua;
    "hypr/lua/general.lua".source = ./lua/general.lua;
    "hypr/lua/input.lua".source = ./lua/input.lua;
    "hypr/lua/touchpad.lua".source = ./lua/touchpad.lua;
    "hypr/lua/rules.lua".source = ./lua/rules.lua;
    "hypr/lua/keybinds.lua".source = ./lua/keybinds.lua;
    "hypr/lua/colors.lua".text = ''
      return {
        base00 = "${config.lib.stylix.colors.base00}",
        base01 = "${config.lib.stylix.colors.base01}",
        base03 = "${config.lib.stylix.colors.base03}",
        base05 = "${config.lib.stylix.colors.base05}",
        base07 = "${config.lib.stylix.colors.base07}",
        base08 = "${config.lib.stylix.colors.base08}",
        base0A = "${config.lib.stylix.colors.base0A}",
        base0B = "${config.lib.stylix.colors.base0B}",
        base0C = "${config.lib.stylix.colors.base0C}",
        base0D = "${config.lib.stylix.colors.base0D}",
        base0E = "${config.lib.stylix.colors.base0E}",
        base0F = "${config.lib.stylix.colors.base0F}",
      }
    '';
  };
}
```

### `hm-modules/desktop/hyprland/hyprland.lua`

```lua
require("lua.monitors")
require("lua.autostart")
require("lua.general")
require("lua.input")
require("lua.touchpad")
require("lua.rules")
require("lua.keybinds")
```

### `hm-modules/desktop/hyprland/lua/autostart.lua`

```lua
-- (pusty)
```

### `hm-modules/desktop/hyprland/lua/input.lua`

```lua
-- (pusty)
```

### `hm-modules/desktop/hyprland/lua/monitors.lua`

```lua
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})
```

### `hm-modules/desktop/hyprland/lua/general.lua`

```lua
local colors = require("lua.colors")

hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("easeOutQuint", {
  type = "bezier",
  points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("easeInOutCubic", {
  type = "bezier",
  points = { { 0.65, 0.05 }, { 0.36, 1 } },
})

hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 4,
  bezier = "easeOutQuint",
})

hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 4,
  bezier = "easeOutQuint",
  style = "popin 80%",
})

hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 3,
  bezier = "easeInOutCubic",
  style = "popin 80%",
})

hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint",
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 4,
  bezier = "easeInOutCubic",
  style = "fade",
})

hl.config({
  general = {
    gaps_in = 6,
    gaps_out = 12,
    border_size = 1,
    layout = "dwindle",
    ["col.active_border"] = "rgb(" .. colors.base0D .. ")",
    ["col.inactive_border"] = "rgb(" .. colors.base03 .. ")",
  },

  decoration = {
    rounding = 8,
    active_opacity = 0.95,
    inactive_opacity = 0.85,

    blur = {
      enabled = true,
      size = 5,
      passes = 2,
    },

    shadow = {
      enabled = true,
      color = "rgba(" .. colors.base00 .. "99)",
      range = 15,
      render_power = 3,
    },
  }
})
```

### `hm-modules/desktop/hyprland/lua/touchpad.lua`

```lua
hl.config({
  input = {
    touchpad = {
      natural_scroll = true,
      tap_to_click = true,
      clickfinger_behavior = true,
      disable_while_typing = true,
      scroll_factor = 0.5,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})
```

### `hm-modules/desktop/hyprland/lua/rules.lua`

```lua
-- 1. Smart Gaps (brak ramek i odstępów, gdy na pulpicie jest tylko 1 okno)
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0, rounding = 0 })

-- 2. Trwałe pulpity (1-5 zawsze widoczne na pasku)
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end

-- 3. Okna pływające dla narzędzi i okien dialogowych
hl.window_rule({ match = { modal = true }, float = true, center = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true, center = true })
hl.window_rule({ match = { class = "pavucontrol" }, float = true, center = true })
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, float = true, center = true, size = { 900, 600 } })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true, center = true })

-- 4. Przypisywanie aplikacji do pulpitów
hl.window_rule({ match = { class = "^firefox$" }, workspace = "1" })
hl.window_rule({ match = { class = "^discord$" }, workspace = "4" })
hl.window_rule({ match = { class = "^Spotify$" }, workspace = "5" })

-- 5. Zapobieganie wygaszaniu ekranu w trybie pełnoekranowym (odtwarzanie wideo/prezentacje)
hl.window_rule({ match = { fullscreen = true }, idle_inhibit = "fullscreen" })
```

### `hm-modules/desktop/hyprland/lua/keybinds.lua`

```lua
local mainMod = "SUPER"

-- Aplikacje
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

-- Okna i sesja
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.exit())

-- Nawigacja (Vim)
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Nawigacja (Strzałki)
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Przesuwanie (Vim)
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Przesuwanie (Strzałki)
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Workspace'y (1-10)
for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Mysz
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Dedykowane klawisze ThinkPad T490
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86Display", hl.dsp.exec_cmd("hyprctl keyword monitor 'eDP-1, disable'"), { locked = true })
hl.bind("XF86WLAN", hl.dsp.exec_cmd("rfkill toggle wifi"), { locked = true })
hl.bind("XF86Bluetooth", hl.dsp.exec_cmd("blueman-manager"))
hl.bind("XF86Favorites", hl.dsp.exec_cmd("kitty -e btop"))

-- Submap: Resize
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
    hl.bind("l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
    hl.bind("h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
end)
```

## `hosts/`

### `hosts/shared/desktop.nix`

```nix
{...}: {
  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "pl_PL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = false;

  # Enable hyprland
  programs.hyprland.enable = true;

  # Enable ly login manager
  services.displayManager.ly.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
```

### `hosts/shared/system.nix`

```nix
{pkgs, ...}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable fish shell system-wide (required for users.users.kamil.shell)
  programs.fish.enable = true;

  # Limit the number of generations to keep
  boot.loader.systemd-boot.configurationLimit = 4;

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Optimize storage
  nix.settings.auto-optimise-store = true;
}
```

### `hosts/shared/users.nix`

```nix
{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "adbusers"];
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    gnome-contacts
    gnome-weather
    gnome-maps
    gnome-characters
    gnome-connections
    gnome-font-viewer
    yelp
    snapshot
    gnome-music
    gnome-console
  ];

  services.xserver.excludePackages = [pkgs.xterm];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # Narzędzia podstawowe / Budowanie
    curl
    wget
    gnumake

    # Formatowanie i Language Server dla Nixa
    alejandra
    nixd

    # Rozszerzenia GNOME
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    # Wymagane przez stylix.targets.gnome (user-theme@gnome-shell-extensions.gcampax.gnome.org)
    gnomeExtensions.user-themes
  ];
}
```

### `hosts/thinkpad/configuration.nix`

```nix
{...}: {
  imports = [
    ./hardware-configuration.nix
    ../shared/desktop.nix
    ../shared/system.nix
    ../shared/users.nix
    ./hardware.nix
  ];

  networking.hostName = "thinkpad";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "26.05";
}
```

### `hosts/thinkpad/hardware-configuration.nix`

```nix
{ config, lib, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/deca6886-1e4c-4dbc-9af0-ddcff085e46c";
      fsType = "btrfs";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/deca6886-1e4c-4dbc-9af0-ddcff085e46c";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/deca6886-1e4c-4dbc-9af0-ddcff085e46c";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F844-AD21";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
```

### `hosts/thinkpad/hardware.nix`

```nix
{pkgs, ...}: {
  # Hardware & Wydajność
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # VA-API → sprzętowe kodowanie wideo
      intel-vaapi-driver # backup VA-API
      intel-compute-runtime-legacy1 # OpenCL/Level Zero dla Darktable
    ];
    extraPackages32 = with pkgs; [
      intel-media-driver
      intel-compute-runtime-legacy1
    ];
  };
  zramSwap.enable = true;
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  services.fstrim.enable = true;
}
```

### `hosts/vm-arm/configuration.nix`

```nix
{...}: {
  imports = [
    ../shared/desktop.nix
    ../shared/system.nix
    ../shared/users.nix
  ];

  networking.hostName = "vm-arm";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "uzupełnij";
}
```
