{
  # disko tylko formatuje przy instalacji (--mode disko).
  # Bieżący system montuje dysk przez hardware-configuration.nix, dlatego
  # wyłączamy generowanie fileSystems / boot.initrd.luks.devices.
  # Po reinstalacji wygeneruj hardware-configuration.nix od nowa — będzie
  # zawierał wpis boot.initrd.luks.devices.crypted i nowe UUID-y.
  disko.enableConfig = false;

  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1"; # Dysk T490
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["fmask=0077" "dmask=0077"]; # Zgodne z obecnym /boot
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings = {
                  allowDiscards = true; # TRIM dla NVMe
                };
                content = {
                  type = "btrfs";
                  extraArgs = ["-f"];

                  # Root to top-level btrfs, tak jak obecnie.
                  mountpoint = "/";

                  subvolumes = {
                    # Subwolumen /home (subvol=home)
                    "home" = {
                      mountpoint = "/home";
                    };

                    # Subwolumen /nix (subvol=nix)
                    "nix" = {
                      mountpoint = "/nix";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
