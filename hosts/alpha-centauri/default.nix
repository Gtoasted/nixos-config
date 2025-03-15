{ config, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

	gtoasted = {
		laptop.enable = true;
	};

  networking.hostName = "alpha-centauri";

  programs.nh.flake = lib.mkIf config.gtoasted.nh.enable "/home/arne/.config/nixos#alpha-centauri";

  # Do not change these
  system.stateVersion = "23.11";
  home-manager = {
    sharedModules = [ {
			home.stateVersion = "23.11";
		} ];
  };
}
