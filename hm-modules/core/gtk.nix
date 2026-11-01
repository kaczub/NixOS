{pkgs, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Material-Noir-Light";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
  };

  # GTK4/libadwaita czyta ikony i kursor z gsettings/dconf,
  # a nie tylko z ~/.config/gtk-3.0/settings.ini.
  dconf.enable = true;
  dconf.settings."org/gnome/desktop/interface" = {
    icon-theme = "Papirus-Dark";
    cursor-theme = "Bibata-Material-Noir-Light";
    cursor-size = 24;
  };
}
