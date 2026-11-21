{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';

    # Fisher nie jest potrzebny — pluginami zarządza Home Manager.
    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];
  };

  programs.zoxide.enable = true;

  # fzf.fish sam ustawia keybindings; wbudowana integracja HM dublowałaby je.
  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
  };
}
