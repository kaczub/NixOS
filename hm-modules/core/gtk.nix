{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    colorScheme = "dark";
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # Noctalia owns noctalia.css (palette) and noctalia-blur.css (translucency).
    # Keeping the imports here means Noctalia's apply.sh leaves gtk.css untouched.
    gtk3.extraCss = ''
      @import url("noctalia.css");
      @import url("noctalia-blur.css");
    '';
    gtk4.extraCss = ''
      @import url("noctalia.css");
      @import url("noctalia-blur.css");
    '';
  };

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
  };

  # GTK4/libadwaita czyta ikony i kursor z gsettings/dconf,
  # a nie tylko z ~/.config/gtk-3.0/settings.ini.
  dconf.enable = true;
  dconf.settings."org/gnome/desktop/interface" = {
    icon-theme = "Papirus-Dark";
    cursor-theme = "Bibata-Modern-Classic";
    cursor-size = 24;
  };
}
