# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
  ];

  networking.hostName = "alpha-centauri"; # Define your hostname.

  # Install firefox.
  programs.firefox.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
