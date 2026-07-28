{pkgs, ...}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "thinkpad";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable fish shell system-wide (required for users.users.kamil.shell)
  programs.fish.enable = true;
}