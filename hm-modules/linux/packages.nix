{pkgs, ...}: {
  # Pakiety, które mają sens tylko na Linuksie (GUI, Wayland, GNOME).
  home.packages = with pkgs; [
    # Komunikacja i przeglądarki
    brave-origin
    vesktop
    telegram-desktop

    # Multimedia
    spotify
    ncspot
    cava

    # Dokumenty i obrazy
    papers
    loupe

    # Biuro
    libreoffice

    # Gry
    prismlauncher

    # Terminal
    kitty

    # Pliki i narzędzia systemowe
    nautilus
    gnome-calculator
    file-roller
    file

    # Schowek Wayland
    wl-clipboard

    # Urządzenia mobilne (na macOS odpowiednikiem jest cask android-platform-tools)
    android-tools

    # Edytory i IDE
    vscode
    opencode-desktop

    # Bezpieczeństwo
    bitwarden-desktop

    # Czcionki
    nerd-fonts.jetbrains-mono
  ];
}
