# flake.nix: The all-encompassing flake that manages the entire config

{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      alpha-centauri = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./machines/alpha-centauri/configuration.nix
          ./nixosModules/default.nix
        ];
      };
    };

    homeManagerModules.default = ./homeManagerModules;

  };
}
