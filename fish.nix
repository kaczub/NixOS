{pkgs, ...}: {
  programs.fish = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    fishPlugins.hydro
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    fuzzyCompletion = true;
    keybindings = true;
  };
}
