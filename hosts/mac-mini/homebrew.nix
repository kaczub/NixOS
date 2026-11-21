{...}: {
  homebrew = {
    enable = true;
    enableFishIntegration = true;

    # Nie usuwamy pakietów spoza listy. Po skompletowaniu listy można
    # zmienić na "check" (bezpieczniejsze niż "zap").
    onActivation = {
      cleanup = "none";
      autoUpdate = false;
      upgrade = false;
    };

    # CLI, których nie dostarcza Nix (reszta jest w hm-modules/shared
    # lub hm-modules/darwin). Obecne w `brew leaves`.
    brews = [
      "f3"
      "gh"
      "mpv"
      "nmap"
      "node"
      "uv"
    ];

    # GUI z /Applications. Przy pierwszym `darwin-rebuild` Homebrew
    # adoptuje już zainstalowane aplikacje (brew bundle robi to samo).
    casks = [
      "android-platform-tools"
      "appcleaner"
      "betterdisplay"
      "bitwarden"
      "brave-browser"
      "discord"
      "ghostty"
      "google-chrome"
      "handbrake-app"
      "keka"
      "lunar-client"
      "macusb"
      "obs"
      "obsidian"
      "opencode-desktop"
      "prismlauncher"
      "protonvpn"
      "sanesidebuttons"
      "steam"
      "visual-studio-code"
      "whatsapp"
    ];

    # Poza Nixem, instalowane ręcznie / z App Store:
    #   Amphetamine
    #   uBlock Origin Lite
    #   Nicotine+
    #   DisableCtrlClick
    #   Python 3.14 (python.org)
  };
}
