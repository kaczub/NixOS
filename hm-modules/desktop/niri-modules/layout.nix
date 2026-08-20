{config, ...}: {
  gaps = 4;
  focus-ring = {
    enable = true;
    width = 2;
    active.color = "#${config.colorScheme.palette.base0D}ff";
    inactive.color = "#${config.colorScheme.palette.base03}ff";
  };
}
