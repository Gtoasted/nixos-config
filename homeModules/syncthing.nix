{ config, lib, ... }: {
	options.gtoasted.syncthing = {
		enable = lib.mkEnableOption "Enable Synthing.";
	};

	config = lib.mkIf config.gtoasted.syncthing.enable {
		services.syncthing = {
			enable = true;
			settings = {
				urAccepted = false;
				devices = {
					sol.id = "SZRCKPW-H2GQO7J-HBLV7TR-I4YGHSH-GPDDL5F-NT45JJK-JCXMGP3-YGCVAQF";
					alpha-centauri.id = "HI6MA6K-L6PHFTW-WJEKQXD-2Y3MHIY-IFQ6NGE-M7RNN2J-TAVORQY-Z5QXPAM";
				};
				folders = {
					"Sync" = {
						path = "~/Sync";
						devices = [
							"sol"
							"alpha-centauri"
						];
						ignorePerms = false;
					};
				};
			};
		};
	};
}
