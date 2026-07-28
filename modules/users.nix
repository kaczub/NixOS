{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    fastfetch
    gnomeExtensions.blur-my-shell
    gnomeExtensions.live-lock-screen
    gnomeExtensions.gsconnect
    gnomeExtensions.clipboard-indicator
    vscode
    brave
    alejandra
    nixd
    discord
    darktable
    spotify
    ghostty
    home-manager
    opencode
  ];
}
