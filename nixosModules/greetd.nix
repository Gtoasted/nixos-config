{ config, lib, pkgs, ... }: {
	options.gtoasted.greetd = {
		enable = lib.mkEnableOption "Enable automatic login to Hyprland.";
	};

	config = lib.mkIf config.gtoasted.greetd.enable {
		services.greetd = {
			enable = true;
			settings = {
				default_session = {
					command = "${pkgs.hyprland}/bin/Hyprland";
					user = "arne";
				};
			};
		};
	};
}
