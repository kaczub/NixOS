{...}: {
  programs.neovim = {
    enable = true;

    extraConfig = ''
      set background=dark
    '';
  };
}