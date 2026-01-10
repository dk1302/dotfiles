{
  description = "Unknownd Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.unknownd = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
	          extraSpecialArgs = { inherit inputs; };
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
