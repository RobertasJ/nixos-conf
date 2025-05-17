{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.services.framework16.fingerprint;
in
{
  options.services.framework16.fingerprint = {
    enable = mkEnableOption "the fingerprint service for the framework 16 laptop";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.fprintd ];

    services.fprintd = {
      enable = true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };

    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="27c6", ENV{ID_MODEL_ID}=="609c", TEST=="power/control", ATTR{power/control}="on"
    '';
  };

}
