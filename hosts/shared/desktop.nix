{
  config,
  lib,
  pkgs,
  ...
}: {
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

  # Greetd + Noctalia Greeter (Wayland login)
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

  # Greeter: password-only PAM auth, so a correct password is checked
  # immediately instead of waiting for pam_fprintd. The `login` service is
  # left untouched, so the lockscreen keeps fingerprint support.
  security.pam.services.greetd.rules.auth = lib.mkForce {
    unix-early = {
      control = "optional";
      modulePath = "${config.security.pam.package}/lib/security/pam_unix.so";
      settings = {
        likeauth = true;
        nullok = true;
      };
      order = 100;
    };
    gnome-keyring = {
      control = "optional";
      modulePath = "${pkgs.gnome-keyring}/lib/security/pam_gnome_keyring.so";
      order = 200;
    };
    unix = {
      control = "sufficient";
      modulePath = "${config.security.pam.package}/lib/security/pam_unix.so";
      settings = {
        likeauth = true;
        nullok = true;
        try_first_pass = true;
      };
      order = 300;
    };
    deny = {
      control = "required";
      modulePath = "${config.security.pam.package}/lib/security/pam_deny.so";
      order = 400;
    };
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Keep X11/XWayland apps on the same layout as niri and the greeter
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
