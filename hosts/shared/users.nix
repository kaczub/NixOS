{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "adbusers" "input"];
  };

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
  ];
}
