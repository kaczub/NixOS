{pkgs, ...}: {
  # Strefa czasowa.
  time.timeZone = "Europe/Warsaw";

  # Ustawienia lokalizacji.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # dconf: ikony/kursor/GTK4
  programs.dconf.enable = true;

  # Niri jako kompozytor Wayland.
  programs.niri.enable = true;

  # Noctalia jako shell (panel, launcher itp.).
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  # Greetd + Noctalia Greeter (logowanie Wayland).
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordlessSyncUsers = ["kamil"];
    settings = {
      keyboard.layout = "pl";
      cursor.size = 24;
      appearance.hide_logo = true;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };

  # Layout klawiatury w konsoli — wszędzie używamy `pl`.
  console.keyMap = "pl";

  # X11/XWayland: ten sam layout co w niri i greeterze.
  services.xserver.xkb.layout = "pl";

  # Menedżer plików: montowanie dysków, kosz i udziały sieciowe.
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Drukowanie przez CUPS.
  services.printing.enable = true;

  # Dźwięk przez PipeWire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Gry.
  programs.steam.enable = true;
}
