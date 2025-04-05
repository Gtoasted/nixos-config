{ lib, inputs, specialArgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
		inputs.sops-nix.nixosModules.sops
		inputs.stylix.nixosModules.stylix
    inputs.nix-easyroam.nixosModules.nix-easyroam
		./users
		./hyprland.nix
		./kde.nix
		./laptop.nix
    ./nh.nix
		./samba.nix
		./sddm.nix
		./stylix.nix
		./system.nix
		./virtualisation.nix
    ./wireguard.nix
    ../secrets
  ];

	gtoasted = {
		system.enable = lib.mkDefault true;
    sops.enable = lib.mkDefault true;
		sddm.enable = lib.mkDefault true;
		hyprland.enable = lib.mkDefault true;
    nh.enable = lib.mkDefault true;
    samba.enable = lib.mkDefault false;
		kde.enable = lib.mkDefault false;
		stylix.enable = lib.mkDefault true;
    wireguard.enable = lib.mkDefault false;
	};

  home-manager = {
    extraSpecialArgs = specialArgs;
    sharedModules = [ ./home ];
  };

  services.gvfs.enable = true; # here temporarily, required for developing my ags bar

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
