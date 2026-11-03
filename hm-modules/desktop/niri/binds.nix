{
  binds = {
    # Uruchamianie
    "Mod+T".spawn = ["kitty"];
    "Mod+Space".spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
    "Mod+S".spawn = ["spotify"];
    "Mod+W".spawn = ["brave"];
    "Mod+E".spawn = ["nautilus"];

    # Noctalia
    "Mod+P" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "session"];
    };
    "Mod+Alt+K" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "calendar"];
    };
    "Mod+Alt+L" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "session" "lock"];
    };
    "Mod+Shift+A" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "audio"];
    };
    "Mod+Shift+B" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "bluetooth"];
    };
    "Mod+Shift+D" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "theme-mode-toggle"];
    };
    "Mod+Shift+M" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "media"];
    };
    "Mod+Shift+N" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "notifications"];
    };
    "Mod+Shift+P" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "power"];
    };
    "Mod+Shift+S" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "settings-toggle"];
    };
    "Mod+Shift+V" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "clipboard"];
    };
    "Mod+Shift+W" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "wallpaper"];
    };
    "Mod+Shift+Y" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "weather"];
    };
    "Mod+Shift+Print" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "screenshot-region"];
    };
    "Mod+Ctrl+Print" = {
      _props = {repeat = false;};
      spawn = ["noctalia" "msg" "screenshot-window"];
    };

    # Mikrofon
    "XF86AudioMicMute" = {
      _props = {
        allow-when-locked = true;
        repeat = false;
      };
      spawn = ["noctalia" "msg" "mic-mute"];
    };

    # Zamykanie / wyjście
    "Mod+Q".close-window = {};
    "Mod+Shift+E".quit = {};

    # Fokus: kolumny (lewo/prawo) i okna (góra/dół)
    "Mod+Left".focus-column-left = {};
    "Mod+Right".focus-column-right = {};
    "Mod+Up".focus-window-up = {};
    "Mod+Down".focus-window-down = {};
    "Mod+H".focus-column-left = {};
    "Mod+L".focus-column-right = {};
    "Mod+K".focus-window-up = {};
    "Mod+J".focus-window-down = {};

    # Przenoszenie: kolumny i okna
    "Mod+Ctrl+Left".move-column-left = {};
    "Mod+Ctrl+Right".move-column-right = {};
    "Mod+Ctrl+Up".move-window-up = {};
    "Mod+Ctrl+Down".move-window-down = {};
    "Mod+Ctrl+H".move-column-left = {};
    "Mod+Ctrl+L".move-column-right = {};
    "Mod+Ctrl+K".move-window-up = {};
    "Mod+Ctrl+J".move-window-down = {};

    # Pierwsza / ostatnia kolumna
    "Mod+Home".focus-column-first = {};
    "Mod+End".focus-column-last = {};
    "Mod+Ctrl+Home".move-column-to-first = {};
    "Mod+Ctrl+End".move-column-to-last = {};

    # Fokus monitora
    "Mod+Shift+Left".focus-monitor-left = {};
    "Mod+Shift+Right".focus-monitor-right = {};
    "Mod+Shift+Up".focus-monitor-up = {};
    "Mod+Shift+Down".focus-monitor-down = {};
    "Mod+Shift+H".focus-monitor-left = {};
    "Mod+Shift+L".focus-monitor-right = {};
    "Mod+Shift+K".focus-monitor-up = {};
    "Mod+Shift+J".focus-monitor-down = {};

    # Przenoszenie kolumny między monitorami
    "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = {};
    "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+H".move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+J".move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+K".move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+L".move-column-to-monitor-right = {};

    # Obszary robocze 1-9
    "Mod+1".focus-workspace = 1;
    "Mod+2".focus-workspace = 2;
    "Mod+3".focus-workspace = 3;
    "Mod+4".focus-workspace = 4;
    "Mod+5".focus-workspace = 5;
    "Mod+6".focus-workspace = 6;
    "Mod+7".focus-workspace = 7;
    "Mod+8".focus-workspace = 8;
    "Mod+9".focus-workspace = 9;
    "Mod+Ctrl+1".move-column-to-workspace = 1;
    "Mod+Ctrl+2".move-column-to-workspace = 2;
    "Mod+Ctrl+3".move-column-to-workspace = 3;
    "Mod+Ctrl+4".move-column-to-workspace = 4;
    "Mod+Ctrl+5".move-column-to-workspace = 5;
    "Mod+Ctrl+6".move-column-to-workspace = 6;
    "Mod+Ctrl+7".move-column-to-workspace = 7;
    "Mod+Ctrl+8".move-column-to-workspace = 8;
    "Mod+Ctrl+9".move-column-to-workspace = 9;

    # Obszary robocze góra/dół
    "Mod+U".focus-workspace-down = {};
    "Mod+I".focus-workspace-up = {};
    "Mod+Ctrl+U".move-column-to-workspace-down = {};
    "Mod+Ctrl+I".move-column-to-workspace-up = {};
    "Mod+Shift+U".move-workspace-down = {};
    "Mod+Shift+I".move-workspace-up = {};
    "Mod+Page_Down".focus-workspace-down = {};
    "Mod+Page_Up".focus-workspace-up = {};
    "Mod+Ctrl+Page_Down".move-column-to-workspace-down = {};
    "Mod+Ctrl+Page_Up".move-column-to-workspace-up = {};
    "Mod+Shift+Page_Down".move-workspace-down = {};
    "Mod+Shift+Page_Up".move-workspace-up = {};

    # Maksymalizacja / pełny ekran / floating
    "Mod+F".maximize-column = {};
    "Mod+Shift+F".fullscreen-window = {};
    "Mod+Shift+Space".toggle-window-floating = {};

    # Rozmiar okna
    "Mod+R".switch-preset-column-width = {};
    "Mod+Shift+R".switch-preset-column-width-back = {};
    "Mod+Ctrl+Shift+R".switch-preset-window-height = {};
    "Mod+Ctrl+R".reset-window-height = {};
    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";
    "Mod+Shift+Minus".set-window-height = "-10%";
    "Mod+Shift+Equal".set-window-height = "+10%";
    "Mod+M".maximize-window-to-edges = {};
    "Mod+Ctrl+F".expand-column-to-available-width = {};
    "Mod+C".center-column = {};
    "Mod+Ctrl+C".center-visible-columns = {};

    # Składanie kolumn
    "Mod+BracketLeft".consume-or-expel-window-left = {};
    "Mod+BracketRight".consume-or-expel-window-right = {};
    "Mod+Comma".consume-window-into-column = {};
    "Mod+Period".expel-window-from-column = {};
    "Mod+Tab".toggle-column-tabbed-display = {};

    # Okna floating
    "Mod+V".toggle-window-floating = {};
    "Mod+Alt+V".switch-focus-between-floating-and-tiling = {};

    # Przegląd
    "Mod+O".toggle-overview = {};

    # Multimedia (przez Noctalia IPC)
    "XF86AudioRaiseVolume" = {
      _props = {allow-when-locked = true;};
      spawn = ["noctalia" "msg" "volume-up"];
    };
    "XF86AudioLowerVolume" = {
      _props = {allow-when-locked = true;};
      spawn = ["noctalia" "msg" "volume-down"];
    };
    "XF86AudioMute" = {
      _props = {allow-when-locked = true;};
      spawn = ["noctalia" "msg" "volume-mute"];
    };
    "XF86MonBrightnessUp" = {
      _props = {allow-when-locked = true;};
      spawn = ["noctalia" "msg" "brightness-up"];
    };
    "XF86MonBrightnessDown" = {
      _props = {allow-when-locked = true;};
      spawn = ["noctalia" "msg" "brightness-down"];
    };

    # Różne
    "Mod+Shift+Slash".show-hotkey-overlay = {};
    "Print".screenshot = {};
  };
}
