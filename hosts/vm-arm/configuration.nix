{...}: {
  imports = [
    ../shared/desktop.nix
    ../shared/system.nix
    ../shared/users.nix
  ];

  networking.hostName = "vm-arm";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "uzupełnij";
}
