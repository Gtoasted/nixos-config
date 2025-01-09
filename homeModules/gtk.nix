{ config, lib, pkgs, ... }: {
	options.gtoasted.gtk = {
		enable = lib.mkEnableOption "Enable gtk";
	};

	config = lib.mkIf config.gtoasted.gtk.enable {
		gtk = {
			enable = true;
			iconTheme = {
				name = "kora";
				package = pkgs.kora-icon-theme;
			};
		};
	};
}

