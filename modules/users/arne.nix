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

    gtoasted.settings = {
      autostart = [
        "ags run"
        "hypridle"
        "syncthing"
      ];
    };

		home-manager = {
			users."arne" = {
				home.username = "arne";
				home.homeDirectory = "/home/arne";
        gtoasted = {
          ags.enable = true;
          hypr.enable = true;
          neovim.enable = true;
          firefox.enable = true;
          git.enable = true;
          java.enable = true;
          librewolf.enable = true;
          notex.enable = true;
          other.enable = true;
          rice = {
            enable = true;
            stylix = true;
            home = false;
            gtk = true;
            qt = true;
          };
          sops.enable = true;
          ssh.enable = true;
          # stylix.enable = true;
          syncthing.enable = true;
        };
			};
		};
	};
}

