{ config, ... }: {
  services.swaync = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        border-radius: 6px;
      }

      .notification-row {
        outline: none;
      }

      .notification {
        background: #${config.colorScheme.palette.base00};
        border: 2px solid #${config.colorScheme.palette.base0D};
        color: #${config.colorScheme.palette.base05};
      }

      .notification-content {
        background: transparent;
        padding: 10px;
      }

      .close-button {
        background: #${config.colorScheme.palette.base08};
        color: #${config.colorScheme.palette.base00};
      }

      .control-center {
        background: #${config.colorScheme.palette.base00};
        border: 2px solid #${config.colorScheme.palette.base0D};
        color: #${config.colorScheme.palette.base05};
        padding: 12px;
      }

      .widget-title {
        color: #${config.colorScheme.palette.base0D};
      }
    '';
  };
}