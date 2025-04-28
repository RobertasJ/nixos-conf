{
  description = "System configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jujutsu = {
      url = "github:jj-vcs/jj";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      jujutsu,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      user = "_robertas";
      hostname = "nixos";
    in
    {
      inherit system;

      nixosConfigurations.${hostname} =
        let
          args = {
            inherit
              system
              hostname
              user
              inputs
              ;
          };
        in
        nixpkgs.lib.nixosSystem {
          specialArgs = args;
          modules = [
            # Basic system configuration
            {
              nixpkgs.config = {
                allowUnfree = true;
              };
              nixpkgs.overlays = [
                jujutsu.overlays.default
              ];
              nix.settings.experimental-features = [
                "nix-command"
                "flakes"
              ];
            }

            # Core system configuration
            ./configuration.nix

            # Home manager configuration
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home.nix args;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
    };
}
