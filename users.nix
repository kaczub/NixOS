{pkgs, ...}: {
  # Define a user account.
  users.users."kamil" = {
    isNormalUser = true;
    description = "Kamil";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      vscode
      brave
      alejandra
      nixd
      discord
      darktable
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    htop
    fastfetch
    vim
  ];
}
