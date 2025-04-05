{ config, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

	gtoasted.kde.enable = true;

  networking.hostName = "sol";

  programs.nh.flake = lib.mkIf config.gtoasted.nh.enable "/home/arne/.config/nixos#alpha-centauri";

  # Do not change these
  system.stateVersion = "24.11";
  home-manager = {
    sharedModules = [ {
			home.stateVersion = "24.11";
		} ];
  };
}
