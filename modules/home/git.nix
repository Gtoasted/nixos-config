{ config, lib, ... }: {
	options.gtoasted.git = {
		enable = lib.mkEnableOption "Enable git.";
	}; 

	config = lib.mkIf config.gtoasted.git.enable {
		programs.git = {
			enable = true;
			userName = "Gtoasted";
			userEmail = "arne@vonlaguna.de";
		};
	}; 
}
