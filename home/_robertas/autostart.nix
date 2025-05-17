{ pkgs, ... }:
{
  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs.kdePackages.yakuake}/share/applications/org.kde.yakuake.desktop"
      "${pkgs.megasync}/share/applications/megasync.desktop"
      "${pkgs.vesktop}/share/applications/vesktop.desktop"
    ];
  };
}
