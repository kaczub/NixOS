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