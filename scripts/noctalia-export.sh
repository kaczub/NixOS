#!/usr/bin/env bash
set -euo pipefail

out="hm-modules/desktop/noctalia/gui.toml"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
tmpdir="$(mktemp -d)"
tmpfile="$(mktemp)"

cleanup() {
  rm -rf "$tmpdir"
  rm -f "$tmpfile"
}
trap cleanup EXIT

# Eksportujemy bazowy config + nadpisania z GUI, ale bez starego gui.toml.
# Dzięki temu uszkodzony snapshot nie blokuje wygenerowania nowego.
mkdir -p "$tmpdir/noctalia"
if [ -f "$config_home/noctalia/config.toml" ]; then
  cp "$config_home/noctalia/config.toml" "$tmpdir/noctalia/config.toml"
fi

NOCTALIA_CONFIG_HOME="$tmpdir" noctalia config export merged | awk '
  /^[[:space:]]*\[/ {
    skip = ($0 ~ /^[[:space:]]*\[+((theme\.templates\.user\.)|(calendar\.account\.)|(wallpaper)|(battery\.device\.)|(location))/)
  }
  !skip && $0 !~ /^[[:space:]]*avatar_path[[:space:]]*=/ { print }
' > "$tmpfile"

noctalia config validate "$tmpfile"

mkdir -p "$(dirname "$out")"
mv "$tmpfile" "$out"

echo "Zapisano $out"
echo "Przejrzyj plik i usuń ewentualne dane wrażliwe przed commitem."
