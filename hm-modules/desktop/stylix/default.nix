{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../cherry-blossom.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
    polarity = "light";
  };
}
