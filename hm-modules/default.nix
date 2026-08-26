{...}: {
  imports = [
    ./core/fish.nix
    ./core/git.nix
    ./core/dirs.nix
    ./core/neovim.nix

    ./apps/ghostty.nix
    ./apps/brave.nix

    ./desktop
  ];
}
