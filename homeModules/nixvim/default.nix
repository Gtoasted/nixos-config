{ config, lib, ...}: {
	options.gtoasted.neovim = {
		enable = lib.mkEnableOption "Enable neovim.";
	};

	config = lib.mkIf config.gtoasted.neovim.enable {
		programs.nixvim = import ./init.nix;
		stylix.targets.nixvim.enable = false;
	};
}
