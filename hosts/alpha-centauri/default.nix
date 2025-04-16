{ config, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

	gtoasted = {
		laptop.enable = true;
    graphics.intel = true;
	};

  networking.hostName = "alpha-centauri";

  # Do not change these
  system.stateVersion = "23.11";
  home-manager = {
    sharedModules = [ {
			home.stateVersion = "23.11";
		} ];
  };
}
