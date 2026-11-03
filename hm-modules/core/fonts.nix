{...}: {
  # Fontconfig jest globalny: to alias dla rodziny "monospace",
  # więc działa w kitty, terminalach i każdej apce, która prosi
  # fontconfig o domyślny monospace. Nie nadpisuje apkom, które
  # mają jawnie ustawiony inny font.
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["JetBrainsMono Nerd Font"];
  };
}
