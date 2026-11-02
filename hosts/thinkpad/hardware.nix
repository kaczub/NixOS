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

  services.fstrim.enable = true;

  # T490: Fn+F11/F12 emit keycodes above 255, which niri cannot bind.
  # Remap the ThinkPad Extra Buttons scancodes to F13/F14.
  services.udev.extraHwdb = ''
    evdev:name:ThinkPad Extra Buttons:dmi:bvn*:bvr*:bd*:svnLENOVO*:pn*
      KEYBOARD_KEY_45=f14
      KEYBOARD_KEY_49=f13
  '';

  hardware.bluetooth.enable = true;

  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;
}
