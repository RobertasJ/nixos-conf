{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.services.framework16.storage;
in
{
  options.services.framework16.storage = {
    enable = mkEnableOption "storage mount on /mnt/storage for Framework laptop";
  };

  config = mkIf cfg.enable {
    fileSystems = {
      "/mnt/storage" = {
        device = "/dev/disk/by-uuid/50014892-f40a-4c91-94ea-ee2029180e51";
        options = [ "nofail" ];
      };
    };
  };
}
