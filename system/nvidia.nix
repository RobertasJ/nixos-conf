{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.services.nvidia;
in
{
  options.services.nvidia = {
    enable = mkEnableOption "NVIDIA graphics support";
  };

  config = mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    };

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      open = true;
      powerManagement.enable = true;
      modesetting.enable = true;

    };
  };
}
