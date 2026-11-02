{...}: {
  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
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

  # Enable niri
  programs.niri.enable = true;

  # Enable noctalia
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  # Ly TUI display manager
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Keep X11/XWayland apps on the same layout as niri and ly
  services.xserver.xkb.layout = "pl";

  # File manager: mounting drives, trash and network shares
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
