{ config, lib, ... }: {
	options.gtoasted.rofi = {
		enable = lib.mkEnableOption "Enable rofi, the application launcher.";
	};

	config = lib.mkIf config.gtoasted.rofi.enable {
		programs.rofi.enable = true;

		home.file = {
			".config/rofi".source = ./config;
		};
	};
}
