{...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      background-opacity = 0.85;
    };
  };
}
