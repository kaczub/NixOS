{pkgs, ...}: {
  imports = [
    ./hm-modules
  ];

  home = {
    username = "kamil";
    homeDirectory = "/home/kamil";
    stateVersion = "26.05";

    packages = with pkgs; [
      # Komunikacja i przeglądarki
      brave
      discord
      telegram-desktop

      # Multimedia
      spotify

      # Dokumenty i obrazy
      papers
      loupe

      # Biuro
      libreoffice

      # Gry
      prismlauncher

      # Terminal i narzędzia CLI
      kitty
      fastfetch
      btop
      ripgrep
      fd
      bat
      eza
      lazygit

      # Urządzenia mobilne
      android-tools

      # Edytory i IDE
      vscode
      opencode
      opencode-desktop

      # Pliki i narzędzia systemowe
      nautilus
      gnome-calculator
      file-roller

      # Bezpieczeństwo
      bitwarden-cli
      bitwarden-desktop

      # Czcionki
      nerd-fonts.jetbrains-mono
    ];
  };
}
