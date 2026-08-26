{config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      set fish_color_command "#${config.colorScheme.palette.base0D}"
      set fish_color_error "#${config.colorScheme.palette.base08}"
      set fish_color_param "#${config.colorScheme.palette.base0A}"
      set fish_color_quote "#${config.colorScheme.palette.base0B}"
      set fish_color_operator "#${config.colorScheme.palette.base0E}"
      set fish_color_autosuggestion "#${config.colorScheme.palette.base03}"
      set fish_color_selection "--background=#${config.colorScheme.palette.base04}"
      set fish_color_search_match "--background=#${config.colorScheme.palette.base04}"
    '';

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
    enable = true;
    enableFishIntegration = true;
  };
}