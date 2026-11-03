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

      # Multimedia
      spotify

      # Dokumenty i obrazy
      papers
      loupe

      # Gry
      prismlauncher

      # Terminal i narzędzia CLI
      kitty
      fastfetch

      # Urządzenia mobilne
      android-tools

      # Edytory i IDE
      vscode
      opencode
      opencode-desktop

      # Pliki i narzędzia systemowe
      nautilus
      gnome-calculator

      # Bezpieczeństwo
      bitwarden-cli
      bitwarden-desktop

      # Czcionki
      nerd-fonts.jetbrains-mono
    ];
  };
}
