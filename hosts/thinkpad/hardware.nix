{pkgs, ...}: {
  # Sprzęt i wydajność
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

  services.fstrim.enable = true;

  # Aktualizacje firmware przez LVFS.
  services.fwupd.enable = true;

  hardware.bluetooth.enable = true;

  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;
}
