{config, ...}: {
  programs.neovim = {
    enable = true;

    extraConfig = ''
      set background=dark
      highlight Normal guibg=#${config.colorScheme.palette.base00} guifg=#${config.colorScheme.palette.base05}
      highlight NormalNC guibg=#${config.colorScheme.palette.base01}
      highlight Comment guifg=#${config.colorScheme.palette.base03}
      highlight String guifg=#${config.colorScheme.palette.base0B}
      highlight Function guifg=#${config.colorScheme.palette.base0D}
      highlight Keyword guifg=#${config.colorScheme.palette.base0E}
      highlight Type guifg=#${config.colorScheme.palette.base0A}
      highlight Number guifg=#${config.colorScheme.palette.base09}
      highlight LineNr guifg=#${config.colorScheme.palette.base03}
      highlight CursorLineNr guifg=#${config.colorScheme.palette.base0D}
      highlight Visual guibg=#${config.colorScheme.palette.base04}
      highlight StatusLine guibg=#${config.colorScheme.palette.base01} guifg=#${config.colorScheme.palette.base05}
      highlight Pmenu guibg=#${config.colorScheme.palette.base01} guifg=#${config.colorScheme.palette.base05}
    '';
  };
}
