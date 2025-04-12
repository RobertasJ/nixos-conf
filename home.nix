{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "_robertas";
  home.homeDirectory = "/home/_robertas";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    kdePackages.yakuake
    zoxide
    rustup
    btop
    _1password-gui
    kdePackages.kate
    vesktop
    nixd
    nil
    nixfmt-rfc-style
    jujutsu
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
    ];

    userSettings = {
      vim_mode = true;
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };

  };

  # Install firefox.
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # 1Password:
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # Dark reader:
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4439735/darkreader-4.9.103.xpi";
          installation_mode = "force_installed";
        };
        "plasma-browser-integration@kde.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4298512/plasma_integration-1.9.1.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  xdg.configFile = {
    "jj/config.toml".source = ./jujutsu.toml;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/_robertas/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
