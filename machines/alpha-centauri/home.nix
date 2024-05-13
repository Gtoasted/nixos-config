{ config, pkgs, ... }:

{
  home.username = "arne";
  home.homeDirectory = "/home/arne";

  home.stateVersion = "23.11";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
