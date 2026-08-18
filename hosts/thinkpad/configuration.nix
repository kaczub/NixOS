{...}: {
  imports = [
    ./hardware-configuration.nix
    ../shared/desktop.nix
    ../shared/system.nix
    ../shared/users.nix
    ./hardware.nix
  ];

  networking.hostName = "thinkpad";
  
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "26.05";
}
