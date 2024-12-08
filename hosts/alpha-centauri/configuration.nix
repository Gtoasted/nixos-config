{ pkgs, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/system/default.nix
    ../../modules/system/laptop.nix

    ../../modules/system/virtualisation.nix

    ../../modules/system/greetd.nix
    ../../modules/system/pam.nix
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
        ../../modules/hypr
      ];
    };
  };
}
