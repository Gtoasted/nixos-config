{ config, lib, ... }: {
	options.gtoasted.sddm = {
		enable = lib.mkEnableOption "Enable sddm.";
	};

	config = lib.mkIf config.gtoasted.sddm.enable {
		services.displayManager.sddm.enable = true;
		services.displayManager.sddm.wayland.enable = true;
	};
}

