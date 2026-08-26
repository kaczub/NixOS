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
