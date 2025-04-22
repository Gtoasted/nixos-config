{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    betterfox.url = "github:HeitorAugustoLN/betterfox-nix";
    flake-utils.url = "github:numtide/flake-utils";
    systems.url = "github:nix-systems/x86_64-linux";
    sops-nix.url = "github:Mic92/sops-nix";
    nixvim.url = "github:nix-community/nixvim";
    stylix.url = "github:danth/stylix";
    nix-easyroam.url = "github:0x5a4/nix-easyroam";
    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";
    ags.url = "github:aylur/ags";

    # Follows
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    nix-easyroam.inputs.nixpkgs.follows = "nixpkgs";
    ags.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      flake-utils,
      home-manager,
      nixpkgs,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        inherit pkgs;
        module = import ./modules/home/nixvim/init.nix;
        extraSpecialArgs = { };
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
      extraLib = nixpkgs.lib.extend (final: prev: import ./lib { lib = prev; });
    in
    {
      nixosConfigurations = {
        alpha-centauri = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs extraLib;
            jetbrains-plugins = inputs.nix-jetbrains-plugins.plugins.${system};
          };
          modules = [ ./hosts/alpha-centauri ];
        };
        sol = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs extraLib;
            jetbrains-plugins = inputs.nix-jetbrains-plugins.plugins.${system};
          };
          modules = [ ./hosts/sol ];
        };
      };

      homeConfigurations = {
        arne = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./hosts/sol-earth/home.nix ];
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (system: {
      checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
      packages.default = nvim;
    });

  nixConfig = {
    experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];
  };
}
