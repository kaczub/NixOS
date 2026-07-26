{pkgs, ...}: {
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    fuzzyCompletion = true;
    keybindings = true;
  };
}
