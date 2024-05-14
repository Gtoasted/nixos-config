# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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
