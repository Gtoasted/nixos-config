{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../modules/templates/laptop.nix
    ../modules/hypr.nix
    ../modules/latex.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "alpha-centauri"; # Define your hostname.

  # Home Manager config
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."arne" = {
      imports = [
        ../modules/home.nix
      ];
    };
  };
}
