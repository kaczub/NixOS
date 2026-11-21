{...}: {
  # Fastfetch jest instalowany w hm-modules/shared/packages.nix.
  # Konfiguracja z logo macOS i układem z obecnego Maca.
  xdg.configFile."fastfetch/config.jsonc".source = ./fastfetch.jsonc;
}
