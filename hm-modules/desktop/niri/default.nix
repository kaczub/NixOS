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
        passes 3
        offset 7.0
        noise 0.02
        saturation 1.0
      }

      // Rysuj obramowanie jako obrys, nie jako wypełniony prostokąt za oknem.
      // Bez tego półprzezroczyste okna GTK są zabarwiane kolorem borderu.
      window-rule {
        draw-border-with-background false
      }

      // Electron trzyma własne CSD; obetnij cienie, żeby obramowanie było widoczne
      // także gdy okno zajmuje całą szerokość ekranu.
      window-rule {
        match app-id=r#"^(discord|brave-browser|spotify|code|ai\.opencode\.desktop)$"#
        draw-border-with-background false
        clip-to-geometry true
      }

      // Blur tylko za wybranymi oknami (app-id do weryfikacji przez `niri msg pick-window`).
      window-rule {
        match app-id="^kitty$"
        match app-id=r#"^ai\.opencode\.desktop$"#
        match app-id=r#"^dev\.noctalia\.Noctalia$"#
        match is-floating=true
        match app-id=r#"^org\.gnome\."#
        exclude app-id=r#"^org\.gnome\.Photos$"#
        exclude app-id=r#"^org\.gnome\.Loupe$"#
        background-effect { blur true; xray false; }
      }

      // Floating: Authenticator (2FA) i pickery plików (okna dialogowe).
      window-rule {
        match app-id="Authenticator"
        open-floating true
      }

      // GNOME Calculator zawsze jako floating.
      window-rule {
        match app-id=r#"^org\.gnome\.Calculator$"#
        open-floating true
      }

      // Displays Settings (F7) jako floating.
      window-rule {
        match app-id="nwg-displays"
        match title="Displays Settings"
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

      // Blurred wallpaper in the overview instead of the flat backdrop color.
      layer-rule {
        match namespace="^noctalia-backdrop"
        place-within-backdrop true
      }

      // Kolory borderów/focus-ringu z aktywnej palety Noctalii.
      // Plik jest generowany w runtime, więc include musi być optional.
      include optional=true "${config.xdg.configHome}/niri/noctalia.kdl"
    '';
  };
}
