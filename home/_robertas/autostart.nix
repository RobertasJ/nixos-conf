{ pkgs, ... }:
{
  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs.kdePackages.yakuake}/share/applications/org.kde.yakuake.desktop"
    ];
  };
}
