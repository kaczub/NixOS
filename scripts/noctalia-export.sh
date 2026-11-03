#!/usr/bin/env bash
set -euo pipefail

out="hm-modules/desktop/noctalia/gui.toml"
mkdir -p "$(dirname "$out")"

# Eksportujemy połączoną konfigurację (config.toml + GUI settings.toml),
# ale odcinamy sekcje zależne od maszyny albo mogące zawierać dane wrażliwe.
noctalia config export merged | awk '
  /^[[:space:]]*\[/ {
    skip = ($0 ~ /^[[:space:]]*\[+((theme\.templates\.user\.)|(calendar\.account\.)|(wallpaper)|(battery\.device\.)|(location))/)
  }
  !skip && $0 !~ /^[[:space:]]*avatar_path[[:space:]]*=/ { print }
' > "$out"

noctalia config validate "$out"

echo "Zapisano $out"
echo "Przejrzyj plik i usuń ewentualne dane wrażliwe przed commitem."
