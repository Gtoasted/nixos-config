{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

	gtoasted = {
		laptop.enable = true;
	};

  networking.hostName = "alpha-centauri";

  programs.bash.shellAliases = {
    nr = "sudo nixos-rebuild switch --flake ~/.config/nixos#alpha-centauri";
  };

  # Do not change these
  system.stateVersion = "23.11";
  home-manager = {
    sharedModules = [ {
			home.stateVersion = "23.11";
		} ];
  };
}
