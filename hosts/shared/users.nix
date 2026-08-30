{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "adbusers" "cdrom"];
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

    # Nagrywanie płyt (K3b): cdrecord, mkisofs, readcd...
    cdrtools

    # Formatowanie i Language Server dla Nixa
    alejandra
    nixd

    # Rozszerzenia GNOME
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
  ];
}
