{
  config,
  lib,
  ...
}: let
  settings = lib.foldl' lib.recursiveUpdate {} [
    (import ./input.nix)
    (import ./layout.nix)
    (import ./binds.nix)
    (import ./outputs.nix)
  ];
in {
  wayland.windowManager.niri = {
    enable = true;
    checkConfig = true;
    inherit settings;
    extraConfig = ''
      spawn-at-startup "noctalia"
      blur {
        passes 3
        offset 3.0
        noise 0.013
        saturation 1.3
      }

      // Rysuj obramowanie jako obrys, nie jako wypełniony prostokąt za oknem.
      // Bez tego półprzezroczyste okna GTK są zabarwiane kolorem borderu.
      window-rule {
        draw-border-with-background false
      }

      // Electron trzyma własne CSD; obetnij cienie, żeby obramowanie było widoczne
      // także gdy okno zajmuje całą szerokość ekranu.
      window-rule {
        match app-id=r#"^([Vv]esktop|brave-origin|com\.brave\.Origin|spotify|code|ai\.opencode\.desktop)$"#
        draw-border-with-background false
        clip-to-geometry true
      }

      // Brave Origin otwieraj jako szerokie okno — na pustym workspace
      // zajmuje miejsce dwóch kolumn.
      window-rule {
        match app-id=r#"^(brave-origin|com\.brave\.Origin)$"#
        open-maximized true
      }

      // Kilka osobnych `match` w jednej regule działa jak OR, dlatego app-id
      // łączymy w jeden regex. `exclude` wyklucza okno z całej reguły.
      // Blur dla wybranych aplikacji (app-id sprawdzisz przez `niri msg pick-window`).
      window-rule {
        match app-id=r#"^(kitty|thunar|xdg-desktop-portal-(gtk|gnome)|ai\.opencode\.desktop|dev\.noctalia\.Noctalia|org\.gnome\..*)$"#
        exclude app-id=r#"^org\.gnome\.(Photos|Loupe)$"#
        background-effect { blur true; }
      }

      // Aplikacje bez własnej przezroczystości: lekka opacity + blur.
      // Opacity przyciemnia całe okno, więc tylko dla wybranych apek.
      window-rule {
        match app-id=r#"^([Vv]esktop|spotify)$"#
        opacity 0.92;
        background-effect { blur true; }
      }

      // Popupy GTK też mają blur i kwadratowe rogi (jak w val-niri).
      window-rule {
        match app-id=r#"^(thunar|xdg-desktop-portal-(gtk|gnome)|org\.gnome\.)"#
        popups {
          geometry-corner-radius 0
          background-effect { blur true; }
        }
      }

      // Blur dla wszystkich okien floating.
      window-rule {
        match is-floating=true
        exclude app-id=r#"^org\.gnome\.(Photos|Loupe)$"#
        background-effect { blur true; }
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

      // Rozmyta tapeta w overview zamiast jednolitego koloru tła.
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
