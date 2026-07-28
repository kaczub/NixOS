{pkgs, ...}: {
  # Hardware & Wydajność
  hardware.graphics.enable = true;
  zramSwap.enable = true;
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
}
