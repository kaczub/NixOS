{
  # Opcja A: disko zarządza montowaniem i odblokowaniem LUKS.
  # fileSystems oraz boot.initrd.luks.devices są generowane z tego configu
  # (disko.enableConfig = true domyślnie), więc hardware-configuration.nix
  # nie definiuje już tych wpisów.
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1"; # Twój dysk z wyjścia findmnt
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
                mountOptions = ["fmask=0077" "dmask=0077"]; # Spójne z obecnym bootloaderem
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
                  subvolumes = {
                    # Dokładny root: subvol=/
                    "" = {
                      mountpoint = "/";
                    };
                    # Subwolumen /home (subvol=/home)
                    "home" = {
                      mountpoint = "/home";
                    };
                    # Subwolumen /nix (subvol=/nix)
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
