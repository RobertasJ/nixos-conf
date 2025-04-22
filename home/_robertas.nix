{ lib, ... }:

{

  imports = lib.filter (n: lib.strings.hasSuffix ".nix" n) (
    lib.filesystem.listFilesRecursive ./_robertas
  );

  home.username = "_robertas";
  home.homeDirectory = "/home/_robertas";

  home.file = { };

  xdg.configFile = {
    "jj/config.toml".source = _robertas/jujutsu.toml;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch --flake .";
    };
  };

  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
}
