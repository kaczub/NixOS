{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "adbusers" "input"];
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    gnome-contacts
    gnome-weather
    gnome-maps
    gnome-characters
    gnome-connections
    gnome-font-viewer
    yelp
    snapshot
    gnome-music
    gnome-console
  ];

  services.xserver.excludePackages = [pkgs.xterm];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # Narzędzia podstawowe / Budowanie
    curl
    wget
    gnumake

    rapid-photo-downloader

    # Workaround: rapid-photo-downloader 0.9.37 (Hatch) nie eksportuje .desktop
    # ani ikony do $out/share — pliki lądują w lib/python*/site-packages, przez co
    # GNOME nie pokazuje aplikacji. Dodajemy własny wpis .desktop i wyciągamy
    # ikonę (rapid-photo-downloader.svg) do motywu hicolor.
    (makeDesktopItem {
      name = "rapid-photo-downloader";
      desktopName = "Rapid Photo Downloader";
      genericName = "Photo Downloader";
      comment = "Photo and video importer for cameras, phones, and memory cards";
      exec = "rapid-photo-downloader %U";
      icon = "rapid-photo-downloader";
      categories = [ "Graphics" "Photography" ];
      startupNotify = false;
    })
    (pkgs.runCommand "rapid-photo-downloader-icon" { } ''
      mkdir -p $out/share/icons/hicolor/scalable/apps
      cp "$(find ${pkgs.rapid-photo-downloader} -name rapid-photo-downloader.svg | head -n1)" \
        $out/share/icons/hicolor/scalable/apps/rapid-photo-downloader.svg
    '')

    # Formatowanie i Language Server dla Nixa
    alejandra
    nixd

    # Rozszerzenia GNOME
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
  ];
}
