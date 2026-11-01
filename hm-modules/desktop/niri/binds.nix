{
  binds = {
    "Mod+T".spawn = ["ghostty"];
    "Mod+D".spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
    "Mod+Q".close-window = {};
    "Mod+Left".focus-column-left = {};
    "Mod+Right".focus-column-right = {};
    
    "XF86AudioRaiseVolume" = {
      _props = { allow-when-locked = true; };
      spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+" "-l" "1.0"];
    };
    "XF86AudioLowerVolume" = {
      _props = { allow-when-locked = true; };
      spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
    };
    "XF86AudioMute" = {
      _props = { allow-when-locked = true; };
      spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
    };
    "XF86MonBrightnessUp" = {
      _props = { allow-when-locked = true; };
      spawn = ["brightnessctl" "set" "5%+"];
    };
    "XF86MonBrightnessDown" = {
      _props = { allow-when-locked = true; };
      spawn = ["brightnessctl" "set" "5%-"];
    };

    "XF86AudioPlay".spawn = ["playerctl" "play-pause"];
    "XF86AudioNext".spawn = ["playerctl" "next"];
    "XF86AudioPrev".spawn = ["playerctl" "previous"];

    "Mod+Shift+Slash".show-hotkey-overlay = {};
    "Mod+Shift+E".quit = {};
    "Print".screenshot = {};
  };
}