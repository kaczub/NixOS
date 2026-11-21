{pkgs, ...}: {
  imports = [
    ./defaults.nix
    ./homebrew.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # Nix jest zarządzany przez Determinate (moduł `determinate` w flake.nix),
  # dlatego nie używamy tutaj opcji `nix.*`.
  system.stateVersion = 7;
  system.primaryUser = "kamil";

  users.users.kamil.home = "/Users/kamil";

  networking = {
    hostName = "mac-mini";
    localHostName = "mac-mini";
    computerName = "Mac mini";
  };

  # Dodaje /run/current-system/sw/bin/fish do /etc/shells.
  # Samą zmianę powłoki robi się raz: chsh -s /run/current-system/sw/bin/fish
  programs.fish.enable = true;
  environment.shells = with pkgs; [fish];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    alejandra
    nixd
    curl
    wget
    gnumake
  ];
}
