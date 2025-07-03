{
  description = "System configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      plasma-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      user = "_robertas";
      hostname = "nixos";
      computer = {
        current = import ./computer.nix;
        laptop = "framework-laptop";
        pc = "pc";
      };

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
              computer
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
                android_sdk.accept_license = true;
              };
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
              home-manager.sharedModules = [
                plasma-manager.homeManagerModules.plasma-manager
              ];
              home-manager.users.${user} = import ./home.nix args;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
    };
}
