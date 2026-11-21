# ThinkPad reinstall with LUKS

[← ThinkPad](README.en.md) · [Polski](INSTALL.md) · English

> **Warning:** `disko` in `destroy,format,mount` mode irreversibly wipes
> `/dev/nvme0n1`. Make a backup first, and push the repository to a remote or
> keep it on a USB drive — the reinstall also removes `/home`.

The target layout is the same as the current one:

- `nvme0n1p1` — 1G, vfat, `/boot` (ESP),
- `nvme0n1p2` — the rest of the disk, LUKS (`crypted`) → btrfs,
- btrfs: top-level root, `home` and `nix` subvolumes.

## 1. Boot the NixOS installer

Boot the installer in UEFI mode and connect to the network. Then clone the
repository and enter it:

```console
git clone <repo-url> /tmp/nixos
cd /tmp/nixos
```

## 2. Check what disko is going to do

```console
sudo nix --experimental-features "nix-command flakes" run \
  github:nix-community/disko/latest -- \
  --mode destroy,format,mount --dry-run ./hosts/thinkpad/disko.nix
```

`--dry-run` only prints the generated script — it does not format anything.

## 3. Format and mount the disk

```console
sudo nix --experimental-features "nix-command flakes" run \
  github:nix-community/disko/latest -- \
  --mode destroy,format,mount ./hosts/thinkpad/disko.nix
```

disko asks for the LUKS passphrase. When it finishes, everything is mounted
under `/mnt`.

## 4. Generate a new hardware-configuration.nix

```console
sudo nixos-generate-config --root /mnt
```

Then **replace** the file in the repository with the generated one:

```console
cp /mnt/etc/nixos/hardware-configuration.nix \
  ./hosts/thinkpad/hardware-configuration.nix
```

Check that the new file contains:

```nix
boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/...";
```

and `fileSystems` entries for `/`, `/home` and `/nix` with `subvol=home` and
`subvol=nix`. If the LUKS entry is missing, add it manually using the partition
UUID:

```console
blkid /dev/nvme0n1p2
```

## 5. Install the system

```console
sudo nixos-install --flake .#thinkpad
```

If the flake does not see the replaced file (dirty Git tree), use the `path:`
form:

```console
sudo nixos-install --flake path:/tmp/nixos#thinkpad
```

After installation, reboot and enter the LUKS passphrase on first boot.

## 6. After the first boot

Clone the repository on the new system (if it is not already in `~/nixos`)
and regenerate `hardware-configuration.nix` from the running encrypted system:

```console
cd ~/nixos
sudo nixos-generate-config --show-hardware-config \
  > hosts/thinkpad/hardware-configuration.nix

git add hosts/thinkpad/hardware-configuration.nix
git commit -m "chore(thinkpad): update hardware config after LUKS reinstall"
```

Alternatively, copy the file the installer left in
`/etc/nixos/hardware-configuration.nix`. From now on, `make update` works on
the encrypted system.

## Optional: disko as the source of truth

Currently `disko.enableConfig = false`, because the checked-in
`hardware-configuration.nix` describes the current unencrypted disk. After a
successful reinstall you can enable:

```nix
disko.enableConfig = true;
```

and remove the `fileSystems` and `boot.initrd.luks.devices` entries from
`hardware-configuration.nix` — disko will then generate them on every rebuild.
Do not do this before the reinstall, because the current system would try to
mount a non-existent `/dev/mapper/crypted`.
