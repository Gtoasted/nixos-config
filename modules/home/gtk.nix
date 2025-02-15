{ config, lib, pkgs, ... }: {
	options.gtoasted.gtk = {
		enable = lib.mkEnableOption "Enable gtk";
	};

	config = lib.mkIf config.gtoasted.gtk.enable {
		home.pointerCursor = {
			gtk.enable = true;
			package = pkgs.catppuccin-cursors.mochaLight;
			name = "Catppuccin-Mocha-Light-Cursors";
			size = 16;
		};

		gtk = {
			enable = true;
			iconTheme = {
				name = "Kora";
				package = pkgs.kora-icon-theme;
			};
		};
	};
}

