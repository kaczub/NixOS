{...}: {
  imports = [
    ./core/fish.nix
    ./core/git.nix
    ./core/dirs.nix
    ./core/neovim.nix
    ./core/gtk.nix

    ./apps/ghostty.nix

    ./desktop/niri
    ./desktop/noctalia
  ];
}
