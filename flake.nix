{
  description = "System configuration";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jujutsu.url = "github:jj-vcs/jj";
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
    in
    {
      inherit system;
      # Please replace my-nixos with your hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          {
            nixpkgs.overlays = [
              jujutsu.overlays.default
            ];
            nixpkgs.config = {
              allowUnfree = true;
            };
            nix.settings.experimental-features = [
              "nix-command"
              "flakes"
            ];
          }

          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import home/_robertas.nix;
            home-manager.backupFileExtension = "backup";
          }

          {
            config._module.args = {
              currentSystem = system;
              currentUser = user;
              inputs = inputs;
            };
          }
        ];
      };
    };
}
