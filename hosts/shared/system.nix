{pkgs, ...}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking.networkmanager.enable = true;

  # Run prebuilt Linux binaries (VS Code Remote-SSH server, extensions)
  programs.nix-ld.enable = true;

  # Enable fish shell system-wide (required for users.users.kamil.shell)
  programs.fish.enable = true;

  # Limit the number of generations to keep
  boot.loader.systemd-boot.configurationLimit = 4;

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Optimize storage
  nix.settings.auto-optimise-store = true;
}
