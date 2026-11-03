{
  lib,
  pkgs,
  ...
}: {
  # Kitty nie jest zarządzany przez Noctalię poza kolorami:
  # Noctalia tworzy ~/.config/kitty/themes/noctalia.conf i dopisuje include.
  # Font trzymamy osobno, żeby nie robić globalnego aliasu fontconfig.
  xdg.configFile."kitty/font.conf".text = ''
    font_family JetBrainsMono Nerd Font
    font_size 11
  '';

  # kitty.conf jest zwykłym plikiem (nie symlinkiem HM), więc Noctalia może
  # nim zarządzać. Dopisujemy tylko include do naszego pliku z fontem.
  home.activation.kittyFontInclude =
    lib.hm.dag.entryAfter ["writeBoundary"] ''
      cfg="$HOME/.config/kitty/kitty.conf"

      if [ -L "$cfg" ]; then
        echo "kitty: $cfg jest symlinkiem (HM); dodaj 'include font.conf' ręcznie" >&2
        exit 0
      fi

      mkdir -p "$(dirname "$cfg")"
      touch "$cfg"
      grep -qxF 'include font.conf' "$cfg" || echo 'include font.conf' >> "$cfg"
    '';
}
