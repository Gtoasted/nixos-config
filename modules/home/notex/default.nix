{ config, lib, pkgs, ... }: {
	options.gtoasted.notex = {
		enable = lib.mkEnableOption "";
	};

	config =
    let
      dataDir = config.xdg.dataHome;
      name = "notyp";
    in
  lib.mkIf config.gtoasted.notex.enable {
    home.file."${dataDir}/typst/packages/local/${name}/".source = ./config;

		home.packages = with pkgs; [
			python3
		];

		home.sessionPath = [
			"/home/arne/Sync/Uni/scripts/bin"
		];
	};
}
