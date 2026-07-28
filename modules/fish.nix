{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fishPlugins.hydro
    fzf
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    fuzzyCompletion = true;
    keybindings = true;
  };
}
