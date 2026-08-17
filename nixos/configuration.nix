{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./nixos/hardware-configuration.nix
    ./nixos/modules/desktop.nix
    ./nixos/modules/system.nix
    ./nixos/modules/users.nix
    ./nixos/modules/hardware.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "26.05";
}
