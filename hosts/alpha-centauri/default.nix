{ inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules
		../../users
  ];

	gtoasted = {
		laptop.enable = true;
	};

  networking.hostName = "alpha-centauri"; # Define your hostname.

  programs.bash.shellAliases = {
    nr = "sudo nixos-rebuild switch --flake .#alpha-centauri --impure";
  };

  # Do not change these
  system.stateVersion = "23.11";
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [ {
			home.stateVersion = "23.11"; # Do not change
		} ];
  };
}
