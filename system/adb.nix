{ ... }:
{
  programs.adb.enable = true;
  users.users._robertas.extraGroups = [ "adbusers" ];
}
