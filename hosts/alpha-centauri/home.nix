{ config, pkgs, ... }: {
  home.username = "arne";
  home.homeDirectory = "/home/arne";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [
    ../../modules
  ];

  programs.home-manager.enable = true;
}
