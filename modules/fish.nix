{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

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
