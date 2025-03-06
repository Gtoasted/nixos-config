{ config, lib, pkgs, ... }: {
	options.gtoasted.notex = {
		enable = lib.mkEnableOption "";
	};

	config =
    let
      dataDir = config.xdg.dataHome;
      notyp = builtins.fromTOML (builtins.readFile ./config/typst.toml);
      name = notyp.package.name;
      version = notyp.package.version;
    in
  lib.mkIf config.gtoasted.notex.enable {
    home.file."${dataDir}/typst/packages/local/${name}/${version}/".source = ./config;

		home.packages = with pkgs; [
			python3
		];

		home.sessionPath = [
			"/home/arne/Sync/Uni/scripts/bin"
		];
	};
}
