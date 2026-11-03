{pkgs, ...}: let
  whiteSurIcons = pkgs.whitesur-icon-theme.override {
    themeVariants = ["grey"];
    alternativeIcons = true;
  };
in {
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    colorScheme = "dark";
    iconTheme = {
      name = "WhiteSur-grey-dark";
      package = whiteSurIcons;
    };

    # Noctalia zarządza noctalia.css (paleta) i noctalia-blur.css (przezroczystość).
    # Importy tutaj sprawiają, że apply.sh Noctalii nie nadpisuje gtk.css.
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
    icon-theme = "WhiteSur-grey-dark";
    cursor-theme = "Bibata-Modern-Classic";
    cursor-size = 24;
  };
}
