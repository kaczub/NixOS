# Słowniczek

[← Index](../README.md) · **Polski** · [English](glossary.en.md)

Krótkie wyjaśnienia pojęć, które pojawiają się w konfiguracji i dokumentacji.
Nazwy opcji i komend zostają po angielsku, bo tak są zapisane w Nixie.

| Pojęcie | Znaczenie |
|---|---|
| **flake** | Zamknięty opis konfiguracji Nixa z wejściami i wyjściami. Zastępuje klasyczne kanały. |
| **input** | Zależność flake'a, np. `nixpkgs` albo `home-manager`. |
| **output** | To, co flake eksportuje, np. `nixosConfigurations.thinkpad`. |
| **flake.lock** | Plik z dokładnymi wersjami wejść. Nie edytuje się go ręcznie — generuje `nix flake lock`. |
| **derivation** | Przepis na zbudowanie pakietu lub pliku w Nixie. |
| **Nix store** | Katalog `/nix/store` z niezmiennymi artefaktami. Ścieżki zawierają hashe. |
| **generation** | Kolejna wersja profilu systemu lub użytkownika. Można się do niej wrócić. |
| **rollback** | Powrót do poprzedniej generacji (`nixos-rebuild --rollback`, `darwin-rebuild --rollback`). |
| **Home Manager (HM)** | Deklaratywne zarządzanie plikami i pakietami użytkownika. |
| **nix-darwin** | Moduły Nixa zarządzające systemem macOS: defaults, usługi, casks. |
| **aktywacja / switch** | Moment, w którym Nix zapisuje nową konfigurację i uruchamia skrypty aktywacyjne. |
| **cask** | Aplikacja GUI instalowana przez Homebrew (np. `ghostty`, `brave-browser`). |
| **formula (brew)** | Narzędzie CLI instalowane przez Homebrew (np. `gh`, `mpv`). |
| **tap** | Dodatkowe repozytorium formuł lub casks dla Homebrew. |
| **Brewfile** | Lista pakietów Homebrew generowana przez nix-darwin z `homebrew.casks` i `homebrew.brews`. |
| **Homebrew prefix** | Katalog instalacji Homebrew. Na Apple Silicon zwykle `/opt/homebrew`. |
| **TCC** | System uprawnień prywatności macOS: kamera, mikrofon, Accessibility, Full Disk Access. |
| **Full Disk Access** | Uprawnienie pozwalające terminalowi lub `darwin-rebuild` zmieniać chronione pliki. |
| **SIP** | System Integrity Protection. Niektóre programy do zarządzania oknami mogą wymagać częściowego wyłączenia. |
| **WM** | Window manager — program układający okna. Np. niri na Linuksie. |
| **tiling** | Automatyczne układanie okien bez nakładania się. |
| **dotfiles** | Pliki konfiguracyjne wersjonowane w repo. Tutaj całość jest w Nixie. |
| **deklaratywnie** | Opisujemy stan docelowy, a nie sekwencję kliknięć. |
| **stateVersion** | Wersja domyślnych ustawień modułów. Nie oznacza wersji systemu. |
| **GC** | Garbage collection — usuwanie nieużywanych ścieżek z Nix store. |
