{config, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=11";
        terminal = "ghostty";
        prompt = "❯ ";
        layer = "overlay";
      };
      colors = {
        background = "${config.colorScheme.palette.base00}e6";
        text = "${config.colorScheme.palette.base05}ff";
        match = "${config.colorScheme.palette.base0D}ff";
        selection = "${config.colorScheme.palette.base02}ff";
        selection-text = "${config.colorScheme.palette.base05}ff";
        border = "${config.colorScheme.palette.base0D}ff";
      };
    };
  };
}
