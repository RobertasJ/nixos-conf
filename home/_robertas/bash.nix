{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      "rebuild" = "run0 nixos-rebuild switch --flake .";
      "nixify" = "nix flake new -t github:nix-community/nix-direnv .";
    };

  };
  home.shell.enableBashIntegration = true;
}
