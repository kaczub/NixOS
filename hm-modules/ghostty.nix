{ ... }: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "Batman";
      font-family = "JetBrainsMono Nerd Font";
      font-size = "12px";
    };
  };
}