{
  description = "Unknownd Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.unknownd = nixpkgs.lib.nixosSystem {
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            backupFileExtension = "backup";
            users.unknownd = import ./home-manager/home.nix;
          };
        }
      ];
    };
  };
}
