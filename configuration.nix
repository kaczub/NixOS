{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/desktop.nix
    ./modules/system.nix
    ./modules/users.nix
    ./modules/hardware.nix
    ./modules/fish.nix
  ];

  system.stateVersion = "26.05";
}
