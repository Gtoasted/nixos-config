{ config, lib, pkgs, ...}: {
  options.gtoasted.rice = {
    enable = lib.mkEnableOption "Enable autoricing.";
    stylix = lib.mkEnableOption "Enable Stylix for home manager.";
    home = lib.mkEnableOption "Enable home.pointerCursor config.";
		gtk = lib.mkEnableOption "Enable gtk.";
  };

  config = let cfg = config.gtoasted.rice; in lib.mkIf cfg.enable {
    xdg.enable = true;

    stylix = lib.mkIf cfg.stylix {
      enable = true;
      iconTheme = {
        package = pkgs.kora-icon-theme;
        dark = "kora";
        light = "kora-light";
      };
    };

		home.pointerCursor = lib.mkIf cfg.home {
			gtk.enable = cfg.gtk;
			package = pkgs.catppuccin-cursors.mochaLight;
			name = "Catppuccin-Mocha-Light-Cursors";
			size = 16;
		};

    home.packages = [ pkgs.kora-icon-theme ];
    
		gtk = lib.mkIf cfg.gtk {
			enable = true;
			iconTheme = {
				name = "kora";
				package = pkgs.kora-icon-theme;
			};
		};
  };
}
