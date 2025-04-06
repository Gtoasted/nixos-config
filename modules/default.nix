{ extraLib, lib, inputs, ... }: {
  imports = (extraLib.getAllChildren ./.) ++ [
    inputs.home-manager.nixosModules.home-manager
		inputs.sops-nix.nixosModules.sops
		inputs.stylix.nixosModules.stylix
    inputs.nix-easyroam.nixosModules.nix-easyroam
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

  nixpkgs.config.allowUnfree = true;
}
