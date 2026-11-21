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
      background = "#1f2428";
      foreground = "#d1d5da";
      selection-background = "#244262";
      selection-foreground = "#d1d5da";
      cursor-color = "#d1d5da";
      cursor-text = "#1f2428";
      palette = [
        "0=#586069"
        "1=#ea4a5a"
        "2=#34d058"
        "3=#ffea7f"
        "4=#2188ff"
        "5=#b392f0"
        "6=#39c5cf"
        "7=#d1d5da"
        "8=#959da5"
        "9=#f97583"
        "10=#85e89d"
        "11=#ffea7f"
        "12=#79b8ff"
        "13=#b392f0"
        "14=#56d4dd"
        "15=#fafbfc"
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
