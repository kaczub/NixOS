{
  config,
  lib,
  ...
}: let
  settings =
    lib.recursiveUpdate
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

      // Blur tylko za wybranymi oknami (app-id do weryfikacji przez `niri msg pick-window`).
      window-rule {
        match app-id="^kitty$"
        match app-id=r#"^com\.mitchellh\.ghostty$"#
        match app-id="opencode"
        match is-floating=true
        match app-id=r#"^org\.gnome\."#
        exclude app-id=r#"^org\.gnome\.Photos$"#
        background-effect { blur true; xray false; }
      }

      // Floating: Authenticator (2FA) i pickery plików (okna dialogowe).
      window-rule {
        match app-id="Authenticator"
        open-floating true
      }

      window-rule {
        match title="Open File"
        match title="Save File"
        match title="Open Folder"
        match title="Select Folder"
        match title="Save As"
        open-floating true
      }

      layer-rule {
        match namespace="^noctalia-"
        background-effect { xray false; }
      }

      // Kolory borderów/focus-ringu z aktywnej palety Noctalii.
      // Plik jest generowany w runtime, więc include musi być optional.
      include optional=true "${config.xdg.configHome}/niri/noctalia.kdl"
    '';
  };
}
