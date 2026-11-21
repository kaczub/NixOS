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

      # Motyw podąża za jasnym/ciemnym motywem systemu.
      theme = "light:Catppuccin Latte,dark:Catppuccin Mocha";

      # Zachowanie i klawisze w stylu Maca.
      macos-option-as-alt = true;
      cursor-style = "block";
      cursor-style-blink = false;
      copy-on-select = "clipboard";
      mouse-hide-while-typing = true;
    };
  };
}
