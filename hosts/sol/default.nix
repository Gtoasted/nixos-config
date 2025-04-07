{ config, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

	gtoasted.kde.enable = true;
  gtoasted.steam.enable = true;

  networking.hostName = "sol";

  # Do not change these
  system.stateVersion = "24.11";
  home-manager = {
    sharedModules = [ {
			home.stateVersion = "24.11";
		} ];
  };
}
