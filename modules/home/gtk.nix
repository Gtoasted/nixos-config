{ config, lib, pkgs, ... }: {
	options.gtoasted.gtk = {
		enable = lib.mkEnableOption "Enable gtk";
	};

	config = lib.mkIf config.gtoasted.gtk.enable {

	};
}

