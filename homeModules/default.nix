{ lib, inputs, ... }: {
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./hypr
		./nixvim
		./firefox.nix
		./git.nix
		./java.nix
		./notex.nix
		./other.nix
  ];

	gtoasted = {
		hypr.enable = lib.mkDefault true;
		neovim.enable = lib.mkDefault true;
		firefox.enable = lib.mkDefault true;
		git.enable = lib.mkDefault true;
		other.enable = lib.mkDefault true;
	};

  nixpkgs = {
    config.allowUnfreePredicate = _: true;
    overlays = [
      ( import ../overlays.nix { } ).additions
    ];
  };

  programs.home-manager.enable = true;

  stylix.targets.nixvim.enable = false;
}
