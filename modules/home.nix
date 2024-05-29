{ config, pkgs, ... }: {
  home.username = "arne";
  home.homeDirectory = "/home/arne";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
