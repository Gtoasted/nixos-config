# machines/alpha-centauri/configuration.nix: config specific to my laptop

{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "alpha-centauri"; # Define your hostname.

  # Install firefox.
  programs.firefox.enable = true;

  # Home Manager config
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."arne" = {
      imports = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
