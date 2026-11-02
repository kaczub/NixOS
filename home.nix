{pkgs, ...}: {
  imports = [
    ./hm-modules
  ];

  home = {
    username = "kamil";
    homeDirectory = "/home/kamil";
    stateVersion = "26.05";

    packages = with pkgs; [
      # Przeglądarka i Komunikacja
      discord
      brave

      # Multimedia i Grafika
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
      localsend

      nerd-fonts.jetbrains-mono
      bibata-cursors
      papirus-icon-theme
      opencode-desktop
    ];
  };
}
