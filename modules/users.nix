{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      vscode
      brave
      alejandra
      nixd
      discord
      darktable
      spotify
      ghostty
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
    gnome-text-editor
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    htop
    fastfetch
    vim

    gnomeExtensions.blur-my-shell
    gnomeExtensions.live-lock-screen
    gnomeExtensions.GsConnect
    gnomeExtensions.clipboard-indicator
  ];
}
