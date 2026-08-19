{pkgs, nix-colors, ...}: {
  imports = [
    nix-colors.homeManagerModules.default
    ./hm-modules/git.nix
    ./hm-modules/fish.nix
    ./hm-modules/ghostty.nix
    ./hm-modules/brave.nix
    ./hm-modules/firefox.nix
    ./hm-modules/neovim.nix
    ./hm-modules/dirs.nix
    ./hm-modules/niri/niri.nix
    ./hm-modules/niri/color-scheme.nix
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
      android-tools

      # Edytory kodu i IDE
      vscode

      # Czcionki
      nerd-fonts.jetbrains-mono
    ];
  };
}
