{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./desktop.nix
    ./system.nix
    ./users.nix
    ./hardware.nix
  ];

  system.stateVersion = "26.05";
}
