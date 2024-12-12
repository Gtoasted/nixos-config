{ pkgs, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../nixosModules/default.nix
    ../../nixosModules/laptop.nix

    ../../nixosModules/virtualisation.nix

    ../../nixosModules/greetd.nix
    ../../nixosModules/pam.nix

    ../../nixosModules/stylix.nix
  ];

  networking.hostName = "alpha-centauri"; # Define your hostname.

  programs.bash.shellAliases = {
    nr = "sudo nixos-rebuild switch --flake .#alpha-centauri --impure";
  };

  nixpkgs.overlays = [
    ( import ../../overlays.nix { } ).additions
  ];

  # Home Manager config
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."arne" = {
      imports = [
        ./home.nix
        ../../homeModules/hypr
        ../../homeModules/java.nix
      ];
    };
  };
}
