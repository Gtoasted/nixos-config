{ lib, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
		inputs.sops-nix.nixosModules.sops
		inputs.stylix.nixosModules.stylix
		../users
		./greetd.nix
		./kde.nix
		./laptop.nix
		./samba.nix
		./stylix.nix
		./system.nix
		./virtualisation.nix
  ];

	gtoasted = {
		system.enable = lib.mkDefault true;
		greetd.enable = lib.mkDefault true;
		stylix.enable = lib.mkDefault true;
	};

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [ ../homeModules ];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    ( import ../overlays.nix { } ).additions
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
