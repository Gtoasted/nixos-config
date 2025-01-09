{ config, lib, pkgs, ... }: {
	options.gtoasted.sddm = {
		enable = lib.mkEnableOption "Enable sddm.";
	};

	config = lib.mkIf config.gtoasted.sddm.enable {
		services.displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			extraPackages = [ pkgs.sddm-sugar-dark ];
			theme = "sugar-dark";
		};
	};
}

