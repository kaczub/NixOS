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
    '';
  };
}