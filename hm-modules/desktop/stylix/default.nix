{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../cherry-blossom.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
    polarity = "light";
  };

  # Stylix writes qt5ct/qt6ct theme files; allow overwriting existing ones
  # instead of failing activation with "would be clobbered".
  xdg.configFile."qt5ct/qt5ct.conf".force = true;
  xdg.configFile."qt6ct/qt6ct.conf".force = true;
}
