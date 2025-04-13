{ ... }:
{
  fileSystems = {
    "/mnt/storage" = {
      device = "/dev/disk/by-uuid/50014892-f40a-4c91-94ea-ee2029180e51";
      options = [ "nofail" ];
    };
  };
}
