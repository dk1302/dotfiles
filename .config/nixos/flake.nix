{
  description = "Unknownd Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
  };

  outputs = { self, nixpkgs, nvf, home-manager, ... }: {
    packages.x86_64-linux.nvf =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./nvf.nix
        ];
      })
      .neovim;
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
