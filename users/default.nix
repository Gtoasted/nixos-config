{ lib, ... }: {
	imports = [
		./arne.nix
	];

	gtoasted.users = {
		arne.enable = lib.mkDefault true;
	};
}
