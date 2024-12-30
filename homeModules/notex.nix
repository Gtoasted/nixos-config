{ config, lib, pkgs, ... }: {
	options.gtoasted.notex = {
		enable = lib.mkEnableOption "";
	};

	config = lib.mkIf config.gtoasted.notex.enable {
		home.packages = with pkgs; [
			python3
		];

		home.sessionPath = [
			"/home/arne/Sync/Uni/scripts/bin"
		];
	};
}
