{ config, lib, ... }: {
	options.gtoasted.kde = {
		enable = lib.mkEnableOption "Enable sddm and KDE Plasma 5.";
	};

	config = lib.mkIf config.gtoasted.kde.enable {
		services.displayManager.sddm.enable = true;
		services.displayManager.sddm.wayland.enable = true;
		services.xserver.desktopManager.plasma5.enable = true;
	};
}
