{ ... }:
{
  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };
    startup.startupScript."start_mega-sync" = {
      text = ''
        mega-sync
      '';
      priority = 4;
    };
  };
}
