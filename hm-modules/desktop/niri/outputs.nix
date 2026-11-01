# ThinkPad T490 — panel wewnętrzny to zwykle eDP-1.
# Sprawdź nazwę i tryby na laptopie: niri msg outputs
{
  _children = [
    {
      output = {
        _args = ["eDP-1"];
        # T490 FHD (1920x1080): 1.0
        # T490 WQHD (2560x1440): 1.5 (albo 2.0)
        scale = 1.0;
      };
    }

    # Zewnętrzny monitor po HDMI / USB-C — odkomentuj i dopasuj po `niri msg outputs`.
    # {
    #   output = {
    #     _args = ["HDMI-A-1"];
    #     mode = "1920x1080@60.000";
    #     scale = 1.0;
    #     position._props = { x = 1920; y = 0; };
    #   };
    # }

    # {
    #   output = {
    #     _args = ["DP-1"];
    #     mode = "2560x1440@60.000";
    #     scale = 1.0;
    #     position._props = { x = 1920; y = 0; };
    #   };
    # }
  ];
}
