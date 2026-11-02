{...}: {
  imports = [
    ./core/fish.nix
    ./core/git.nix
    ./core/dirs.nix
    ./core/neovim.nix
    ./core/gtk.nix
    ./core/env.nix
    ./core/zed.nix

    ./desktop/niri
    ./desktop/noctalia
  ];
}
