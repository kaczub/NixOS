{...}: {
  # Aplikacja Ghostty jest instalowana jako cask (hosts/mac-mini/homebrew.nix).
  # Tutaj tylko konfiguracja i integracja z fish.
  programs.ghostty = {
    enable = true;
    package = null;
    enableFishIntegration = true;

    settings = {
      # SF Mono jako podstawowy; Nerd Font jako fallback dla ikon w promptach.
      font-family = [
        "SF Mono"
        "JetBrainsMono Nerd Font"
      ];
      font-size = 13;
      font-thicken = true;

      # Frosted glass w stylu macOS.
      background-opacity = 0.85;
      background-blur = true;
      macos-titlebar-style = "transparent";
      window-padding-x = 12;
      window-padding-y = 12;
      window-padding-balance = true;

      # Stały ciemny schemat kolorów.
      background = "#262626";
      foreground = "#bcbcbc";
      selection-background = "#87afd7";
      selection-foreground = "#262626";
      cursor-color = "#bcbcbc";
      cursor-text = "#262626";
      palette = [
        "0=#1c1c1c"
        "1=#af5f5f"
        "2=#5f875f"
        "3=#87875f"
        "4=#5f87af"
        "5=#5f5f87"
        "6=#5f8787"
        "7=#6c6c6c"
        "8=#444444"
        "9=#ff8700"
        "10=#87af87"
        "11=#ffffaf"
        "12=#87afd7"
        "13=#8787af"
        "14=#5fafaf"
        "15=#ffffff"
      ];

      # Zachowanie i klawisze w stylu Maca.
      macos-option-as-alt = true;
      cursor-style = "block";
      cursor-style-blink = false;
      copy-on-select = "clipboard";
      mouse-hide-while-typing = true;
    };
  };
}
