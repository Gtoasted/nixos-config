{ config, lib, pkgs, ... }: {
	options.gtoasted.java = {
		enable = lib.mkEnableOption "Enable Java";
	};

	config = lib.mkIf config.gtoasted.java.enable {
		home.packages = with pkgs; [
			gradle
			jdk21
		];
	};
}
