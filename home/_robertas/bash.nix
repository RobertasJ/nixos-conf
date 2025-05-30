{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch --flake .";
      "nixify" = "nix flake new -t github:nix-community/nix-direnv .";
    };

  };
  home.shell.enableBashIntegration = true;
}
