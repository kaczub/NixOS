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

  # Lutris' FHS env still pulls gtk2, which nixpkgs 26.11 marks as broken.
  nixpkgs.config.problems.handlers."gtk+".broken = "warn";

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
