# Reinstalacja ThinkPada z LUKS

> **Uwaga:** `disko` w trybie `destroy,format,mount` nieodwracalnie usuwa dane
> z `/dev/nvme0n1`. Zrób backup przed rozpoczęciem, a repozytorium wypchnij do
> zdalnego repo albo trzymaj na USB — reinstalacja usunie też `/home`.

Docelowy układ jest taki sam jak obecny:

- `nvme0n1p1` — 1G, vfat, `/boot` (ESP),
- `nvme0n1p2` — reszta dysku, LUKS (`crypted`) → btrfs,
- btrfs: root jako top-level, subwolumeny `home` i `nix`.

## 1. Boot z instalatora NixOS

Uruchom instalator w trybie UEFI i połącz się z siecią. Następnie sklonuj
repozytorium i wejdź do niego:

```console
git clone <adres-repo> /tmp/nixos
cd /tmp/nixos
```

## 2. Sprawdź, co disko zamierza zrobić

```console
sudo nix --experimental-features "nix-command flakes" run \
  github:nix-community/disko/latest -- \
  --mode destroy,format,mount --dry-run ./hosts/thinkpad/disko.nix
```

`--dry-run` tylko wypisuje wygenerowany skrypt — niczego nie formatuje.

## 3. Sformatuj i zamontuj dysk

```console
sudo nix --experimental-features "nix-command flakes" run \
  github:nix-community/disko/latest -- \
  --mode destroy,format,mount ./hosts/thinkpad/disko.nix
```

Disko zapyta o hasło do LUKS. Po zakończeniu wszystko będzie zamontowane
w `/mnt`.

## 4. Wygeneruj nowy hardware-configuration.nix

```console
sudo nixos-generate-config --root /mnt
```

Następnie **podmień** plik w repo na wygenerowany:

```console
cp /mnt/etc/nixos/hardware-configuration.nix \
  ./hosts/thinkpad/hardware-configuration.nix
```

Sprawdź, czy nowy plik zawiera:

```nix
boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/...";
```

oraz wpisy `fileSystems` dla `/`, `/home` i `/nix` z `subvol=home` i
`subvol=nix`. Jeśli wpisu LUKS nie ma, dodaj go ręcznie, biorąc UUID partycji:

```console
blkid /dev/nvme0n1p2
```

## 5. Zainstaluj system

```console
sudo nixos-install --flake .#thinkpad
```

Jeśli flake nie widzi podmienionego pliku (brudne drzewo git), użyj wersji
`path:`:

```console
sudo nixos-install --flake path:/tmp/nixos#thinkpad
```

Po instalacji zrestartuj i przy pierwszym bootcie podaj hasło do LUKS.

## 6. Po pierwszym uruchomieniu

Sklonuj repozytorium na nowy system (jeśli nie ma go już w `/home/kamil/nixos`)
i odtwórz `hardware-configuration.nix` z działającego, zaszyfrowanego systemu:

```console
cd ~/nixos
sudo nixos-generate-config --show-hardware-config \
  > hosts/thinkpad/hardware-configuration.nix

git add hosts/thinkpad/hardware-configuration.nix
git commit -m "chore(thinkpad): update hardware config after LUKS reinstall"
```

Alternatywnie skopiuj plik, który instalator zostawił w
`/etc/nixos/hardware-configuration.nix`. Od tej pory `make update` działa już
na zaszyfrowanym systemie.

## Opcjonalnie: disko jako źródło prawdy

Obecnie `disko.enableConfig = false`, bo checked-in
`hardware-configuration.nix` opisuje bieżący, niezaszyfrowany dysk. Po
skutecznej reinstalacji możesz zamiast tego włączyć:

```nix
disko.enableConfig = true;
```

i usunąć z `hardware-configuration.nix` wpisy `fileSystems` oraz
`boot.initrd.luks.devices` — wtedy disko będzie generował je przy każdym
rebuildzie. Nie rób tego przed reinstalacją, bo bieżący system próbowałby
montować nieistniejące `/dev/mapper/crypted`.
