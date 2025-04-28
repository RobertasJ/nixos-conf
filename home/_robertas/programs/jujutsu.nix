{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jujutsu
  ];

  xdg.configFile = {
    "jj/config.toml".source = jujutsu/jujutsu.toml;
  };
}
