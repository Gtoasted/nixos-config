{ lib, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
		inputs.sops-nix.nixosModules.sops
		inputs.stylix.nixosModules.stylix
		../users
		./greetd.nix
		./hyprland.nix
		./kde.nix
		./laptop.nix
		./samba.nix
		./sddm.nix
		./stylix.nix
		./system.nix
		./virtualisation.nix
  ];

	gtoasted = {
		system.enable = lib.mkDefault true;
		# greetd.enable = lib.mkDefault true;
		sddm.enable = lib.mkDefault true;
		hyprland.enable = lib.mkDefault true;
		stylix.enable = lib.mkDefault true;
	};

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [ ../homeModules ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
