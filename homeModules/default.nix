{ lib, inputs, ... }: {
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		inputs.sops-nix.homeManagerModules.sops
		./hypr
		./nixvim
		./firefox.nix
		./git.nix
		./java.nix
		./notex.nix
		./other.nix
		./sops.nix
		./ssh.nix
		./syncthing.nix
  ];

	gtoasted = {
		hypr.enable = lib.mkDefault true;
		neovim.enable = lib.mkDefault true;
		firefox.enable = lib.mkDefault true;
		git.enable = lib.mkDefault true;
		other.enable = lib.mkDefault true;
		sops.enable = lib.mkDefault true;
		ssh.enable = lib.mkDefault true;
		syncthing.enable = lib.mkDefault true;
	};

  nixpkgs = {
    config.allowUnfreePredicate = _: true;
    overlays = [
      ( import ../overlays.nix { } ).additions
    ];
  };

  programs.home-manager.enable = true;
}
