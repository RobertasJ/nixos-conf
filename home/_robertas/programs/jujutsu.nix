{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    jujutsu
  ];

  xdg.configFile = {
    "jj/config.toml".source = jujutsu/jujutsu.toml;
  };

  programs.git = {
    enable = true;
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };

      user = {
        signingKey = "...";
      };
    };
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        IdentityAgent ~/.1password/agent.sock
    '';
  };

  home.file.".ssh/config" = {
    target = ".ssh/config_source";
    onChange = ''cat ~/.ssh/config_source > ~/.ssh/config && chmod 400 ~/.ssh/config'';
  };

}
