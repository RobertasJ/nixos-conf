{ ... }:
{
  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };
    startup.startupScript."start_mega-cmd" = {
      text = ''
        mega-cmd
      '';
      priority = 4;
    };
  };
}
