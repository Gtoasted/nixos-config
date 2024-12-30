{ config, lib, ... }: {
	options.gtoasted.sops = {
		enable = lib.mkEnableOption "Enable the sops home manager module";
	};

	config = lib.mkIf config.gtoasted.sops.enable {
		sops.age.keyFile = "/home/arne/.config/sops/age/keys.txt";
	};
}
