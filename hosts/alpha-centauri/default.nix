{ inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules
    ../../nixosModules/laptop.nix

    ../../nixosModules/virtualisation.nix

    ../../nixosModules/greetd.nix

    ../../nixosModules/stylix.nix
    ../../nixosModules/vlc.nix
		../../users
  ];

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
