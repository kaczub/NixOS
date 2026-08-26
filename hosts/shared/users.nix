{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "adbusers"];
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

    # Formatowanie i Language Server dla Nixa
    alejandra
    nixd

    # Rozszerzenia GNOME
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    # Wymagane przez stylix.targets.gnome (user-theme@gnome-shell-extensions.gcampax.gnome.org)
    gnomeExtensions.user-theme
  ];
}
