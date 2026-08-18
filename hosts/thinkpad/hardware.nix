{pkgs, ...}: {
  # Hardware & Wydajność
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # VA-API → sprzętowe kodowanie wideo
      intel-vaapi-driver # backup VA-API
      intel-compute-runtime-legacy1 # OpenCL/Level Zero dla Darktable
    ];
    extraPackages32 = with pkgs; [
      intel-media-driver
      intel-compute-runtime-legacy1
    ];
  };
  zramSwap.enable = true;
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  services.fstrim.enable = true
}
