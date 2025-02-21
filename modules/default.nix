{ lib, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
		inputs.sops-nix.nixosModules.sops
		inputs.stylix.nixosModules.stylix
    inputs.nix-easyroam.nixosModules.nix-easyroam
		./users
		./greetd.nix
		./hyprland.nix
		./kde.nix
		./laptop.nix
		./samba.nix
		./sddm.nix
		./stylix.nix
		./system.nix
		./virtualisation.nix
    ./wireguard.nix
  ];

	gtoasted = {
		system.enable = lib.mkDefault true;
		# greetd.enable = lib.mkDefault true;
		sddm.enable = lib.mkDefault true;
		hyprland.enable = lib.mkDefault true;
    samba.enable = lib.mkDefault true;
		kde.enable = lib.mkDefault true;
		stylix.enable = lib.mkDefault true;
    wireguard.enable = lib.mkDefault true;
	};

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [ ./home ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
