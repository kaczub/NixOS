{...}: {
  # Bazowa konfiguracja deklaratywna. Zmiany z GUI trafiają do
  # ~/.local/state/noctalia/settings.toml i mają pierwszeństwo nad tym plikiem.
  programs.noctalia = {
    enable = true;

    settings = {
      backdrop = {
        enabled = true;
        blur_intensity = 0.63;
        tint_intensity = 0.70;
      };
      shell.greeter_sync.auto_sync = true;

      theme.templates.user = {
        "gtk-blur-3" = {
          input_path = ./gtk-blur-3.css;
          output_path = "$XDG_CONFIG_HOME/gtk-3.0/noctalia-blur.css";
          index = 20;
        };
        "gtk-blur-4" = {
          input_path = ./gtk-blur-4.css;
          output_path = "$XDG_CONFIG_HOME/gtk-4.0/noctalia-blur.css";
          index = 21;
        };
      };
    };
  };

  # Snapshot ustawień z GUI. Noctalia wczytuje wszystkie pliki *.toml
  # z ~/.config/noctalia/, a ten plik jest generowany przez
  # `make noctalia-export`.
  xdg.configFile."noctalia/gui.toml".source = ./gui.toml;
}
