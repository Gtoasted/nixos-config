{ config, lib, ... }: {
	options.gtoasted.git = {
		enable = lib.mkEnableOption "";
	}; 

	config = lib.mkIf config.gtoasted.git.enable {
		programs.git = {
			enable = true;
			userName = "Gtoasted";
			userEmail = "arne@vonlaguna.de";
		};
	}; 
}
