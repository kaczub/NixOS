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
      vesktop
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

      # TUI
      yazi
      ncspot
      cava
      cmatrix
      pipes
      glow
      rainfrog

      # Sieć i media
      yt-dlp
      ffmpeg

      # Zależności Yazi: podgląd PDF/video, archiwa, JSON, schowek
      file
      chafa
      jq
      poppler-utils
      resvg
      _7zz
      wl-clipboard

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
