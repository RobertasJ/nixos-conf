{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.fprintd ];

  services.fprintd = {
    enable = true;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-goodix;
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="27c6", ENV{ID_MODEL_ID}=="609c", TEST=="power/control", ATTR{power/control}="on"
  '';
}
