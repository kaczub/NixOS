{config, lib, ...}: {
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      theme = {
        mode = "light";
        source = "custom";
        custom_palette = "Stylix";
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

    customPalettes.Stylix = {
      dark = {
        mPrimary = "#${config.lib.stylix.colors.base0D}";
        mOnPrimary = "#${config.lib.stylix.colors.base00}";
        mSecondary = "#${config.lib.stylix.colors.base0C}";
        mOnSecondary = "#${config.lib.stylix.colors.base00}";
        mTertiary = "#${config.lib.stylix.colors.base0A}";
        mOnTertiary = "#${config.lib.stylix.colors.base00}";
        mError = "#${config.lib.stylix.colors.base08}";
        mOnError = "#${config.lib.stylix.colors.base07}";
        mSurface = "#${config.lib.stylix.colors.base00}";
        mOnSurface = "#${config.lib.stylix.colors.base05}";
        mSurfaceVariant = "#${config.lib.stylix.colors.base01}";
        mOnSurfaceVariant = "#${config.lib.stylix.colors.base04}";
        mOutline = "#${config.lib.stylix.colors.base03}";
        mShadow = "#${config.lib.stylix.colors.base00}";
        mHover = "#${config.lib.stylix.colors.base01}";
        mOnHover = "#${config.lib.stylix.colors.base05}";
      };

      light = {
        mPrimary = "#${config.lib.stylix.colors.base0D}";
        mOnPrimary = "#${config.lib.stylix.colors.base07}";
        mSecondary = "#${config.lib.stylix.colors.base0C}";
        mOnSecondary = "#${config.lib.stylix.colors.base07}";
        mTertiary = "#${config.lib.stylix.colors.base0A}";
        mOnTertiary = "#${config.lib.stylix.colors.base00}";
        mError = "#${config.lib.stylix.colors.base08}";
        mOnError = "#${config.lib.stylix.colors.base07}";
        mSurface = "#${config.lib.stylix.colors.base07}";
        mOnSurface = "#${config.lib.stylix.colors.base00}";
        mSurfaceVariant = "#${config.lib.stylix.colors.base06}";
        mOnSurfaceVariant = "#${config.lib.stylix.colors.base03}";
        mOutline = "#${config.lib.stylix.colors.base03}";
        mShadow = "#${config.lib.stylix.colors.base00}";
        mHover = "#${config.lib.stylix.colors.base06}";
        mOnHover = "#${config.lib.stylix.colors.base00}";
      };
    };
  };
}
