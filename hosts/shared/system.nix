{pkgs, ...}: {
  # Zezwalaj na pakiety z niewolną licencją (Discord, Spotify, Steam itp.).
  nixpkgs.config.allowUnfree = true;

  # Program rozruchowy.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Najnowsze jądro.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Sieć.
  networking.networkmanager.enable = true;

  # VPN mesh (konfiguracja przez `sudo tailscale up`).
  services.tailscale.enable = true;

  # Uruchamianie gotowych binarek Linuksa (serwer VS Code Remote-SSH, rozszerzenia).
  programs.nix-ld.enable = true;

  # Fish systemowo — wymagane przez users.users.kamil.shell.
  programs.fish.enable = true;

  # Limit liczby generacji systemu.
  boot.loader.systemd-boot.configurationLimit = 4;

  # Cotygodniowe czyszczenie starych generacji.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Hardlinkowanie identycznych plików w store.
  nix.settings.auto-optimise-store = true;
}
