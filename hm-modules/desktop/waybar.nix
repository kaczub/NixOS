{config, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = ["niri/workspaces" "niri/window"];
        modules-center = ["clock"];
        modules-right = ["wireplumber" "network" "battery"];

        clock = {
          format = "{:%H:%M  •  %d.%m.%Y}";
        };
        battery = {
          format = "󰁹 {capacity}%";
          format-charging = "󰂄 {capacity}%";
        };
        network = {
          format-wifi = "󰤨 {essid}";
          format-disconnected = "󰤭 Off";
        };
        wireplumber = {
          format = "󰕾 {volume}%";
          format-muted = "󰝟 Muted";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }

      window#waybar {
        background-color: #${config.colorScheme.palette.base00};
        color: #${config.colorScheme.palette.base05};
        border-bottom: 2px solid #${config.colorScheme.palette.base01};
      }

      #workspaces button {
        padding: 0 8px;
        color: #${config.colorScheme.palette.base04};
      }

      #workspaces button.active {
        color: #${config.colorScheme.palette.base0D};
      }

      #clock, #battery, #network, #wireplumber, #window {
        padding: 0 10px;
      }
    '';
  };
}
