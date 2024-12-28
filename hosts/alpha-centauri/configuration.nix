{ pkgs, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../nixosModules/default.nix
    ../../nixosModules/laptop.nix

    ../../nixosModules/virtualisation.nix

    ../../nixosModules/greetd.nix

    ../../nixosModules/stylix.nix
    ../../nixosModules/vlc.nix
  ];

  networking.hostName = "alpha-centauri"; # Define your hostname.

  programs.bash.shellAliases = {
    nr = "sudo nixos-rebuild switch --flake .#alpha-centauri --impure";
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [
      {
        home.stateVersion = "23.11"; # Do not change
      }
    ];
  };
}
