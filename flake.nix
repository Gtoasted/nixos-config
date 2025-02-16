{
  description = "Nixos config flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		betterfox = {
			url = "github:HeitorAugustoLN/betterfox-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    nix-easyroam = {
      url = "github:0x5a4/nix-easyroam";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    nixosConfigurations = {
      alpha-centauri = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
            inherit inputs;
            jetbrains-plugins = inputs.nix-jetbrains-plugins.plugins."${system}";
          };
        modules = [ ./hosts/alpha-centauri ];
      };
    };

    homeConfigurations = {
      arne = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./hosts/sol-earth/home.nix ];
      };
    };
  };
}
