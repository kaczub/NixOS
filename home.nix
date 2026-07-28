{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hm-modules/git.nix
    ./hm-modules/fish.nix
    ./hm-modules/ghostty.nix
    ./hm-modules/brave.nix
  ];

  home = {
    username = "kamil";
    homeDirectory = "/home/kamil";
    stateVersion = "26.05";

    packages = with pkgs; [
      # Przeglądarka i Komunikacja
      discord

      # Multimedia i Grafika
      darktable
      spotify

      # Gry i Narzędzia
      lutris
      prismlauncher
      qbittorrent

      # Narzędzia CLI
      fastfetch
      opencode
      home-manager
      android-tools

      # Edytory kodu i IDE
      vscode

      # Czcionki
      nerd-fonts.jetbrains-mono
    ];
  };
}
