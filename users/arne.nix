{ config, lib, ... }: {
	options.gtoasted.users.arne = {
		enable = lib.mkEnableOption "Enable user arne.";
	};

	config = lib.mkIf config.gtoasted.users.arne.enable {
		users.users.arne = {
			isNormalUser = true;
			description = "Arne von Laguna";
			extraGroups = [
				"networkmanager"
				"wheel"
				"scanner"
				"lp"
				"libvirtd" 
			];
		};

		home-manager = {
			users."arne" = {
				imports = [ ../homeModules ];
				home.username = "arne";
				home.homeDirectory = "/home/arne";
			};
		};
	};
}

