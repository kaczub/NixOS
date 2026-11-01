{ lib, ... }:
let
  settings = lib.recursiveUpdate
    (import ./input.nix)
    (lib.recursiveUpdate (import ./layout.nix)
      (lib.recursiveUpdate (import ./binds.nix) (import ./outputs.nix)));
in {
  wayland.windowManager.niri = {
    enable = true;
    checkConfig = true;
    settings = settings;
    extraConfig = ''
      spawn-at-startup "noctalia"
  blur {
    passes 2
    offset 3.0
    noise 0.02
    saturation 1.0
  }

  window-rule {
    background-effect { blur true; xray false; }
  }

  layer-rule {
    match namespace="^noctalia-"
    background-effect { xray false; }
  }
'';
  };
}