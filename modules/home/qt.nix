{ config, lib, ... }: {
	options.gtoasted.qt = {
		enable = lib.mkEnableOption "Enable qt.";
	};

	config = lib.mkIf config.gtoasted.qt.enable {
		qt = {
			enable = true;
			platformTheme.name = "gtk";
		};
	};
}

