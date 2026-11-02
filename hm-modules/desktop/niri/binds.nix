{
  binds = {
    "Mod+T".spawn = ["ghostty"];
    "Mod+Space".spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
    "Mod+Q".close-window = {};
    "Mod+Left".focus-column-left = {};
    "Mod+Right".focus-column-right = {};
    
    "XF86AudioRaiseVolume" = {
      _props = { allow-when-locked = true; };
      spawn = ["noctalia" "msg" "volume-up"];
    };
    "XF86AudioLowerVolume" = {
      _props = { allow-when-locked = true; };
      spawn = ["noctalia" "msg" "volume-down"];
    };
    "XF86AudioMute" = {
      _props = { allow-when-locked = true; };
      spawn = ["noctalia" "msg" "volume-mute"];
    };
    "XF86MonBrightnessUp" = {
      _props = { allow-when-locked = true; };
      spawn = ["noctalia" "msg" "brightness-up"];
    };
    "XF86MonBrightnessDown" = {
      _props = { allow-when-locked = true; };
      spawn = ["noctalia" "msg" "brightness-down"];
    };

    "XF86AudioPlay".spawn = ["noctalia" "msg" "media" "toggle"];
    "XF86AudioNext".spawn = ["noctalia" "msg" "media" "next"];
    "XF86AudioPrev".spawn = ["noctalia" "msg" "media" "previous"];

    "Mod+Shift+Slash".show-hotkey-overlay = {};
    "Mod+Shift+E".quit = {};
    "Print".screenshot = {};
  };
}