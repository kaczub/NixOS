{pkgs, ...}: {
  # Narzędzia CLI i TUI wspólne dla NixOS i macOS.
  # Aplikacje GUI są instalowane per host (nixpkgs na Linuksie, casks na macOS).
  home.packages = with pkgs; [
    # Terminal i narzędzia CLI
    fastfetch
    btop
    ripgrep
    fd
    bat
    eza
    lazygit

    # TUI
    yazi
    cmatrix
    pipes
    glow
    rainfrog

    # Sieć i media
    yt-dlp
    ffmpeg

    # Zależności Yazi: podgląd PDF/video, archiwa, JSON
    chafa
    jq
    poppler-utils
    resvg
    _7zz

    # Edytory i IDE
    opencode

    # Bezpieczeństwo
    bitwarden-cli
  ];
}
