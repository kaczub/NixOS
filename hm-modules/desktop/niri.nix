{config, ...}: {
  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;

      binds = import ./niri-modules/binds.nix;
      layout = import ./niri-modules/layout.nix {inherit config;};
      input = import ./niri-modules/input.nix;
      spawn-at-startup = import ./niri-modules/autostart.nix;
    };
  };
}
