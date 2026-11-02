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
      prismlauncher

      # Narzędzia CLI
      fastfetch
      android-tools

      # Edytory kodu i IDE
      vscode
      kitty

      # Pliki i narzędzia (zamienniki GNOME)
      nautilus
      gnome-calculator
      papers
      loupe

      nerd-fonts.jetbrains-mono
      bibata-cursors
      numix-icon-theme-circle
      opencode-desktop
      opencode
      bitwarden-cli
      bitwarden-desktop
      
    ];
  };
}
