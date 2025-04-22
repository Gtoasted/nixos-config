{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/home
    inputs.stylix.homeManagerModules.stylix
  ];

  home.username = "arne";
  home.homeDirectory = "/home/arne";

  gtoasted = {
    neovim.enable = true;
    firefox.enable = false;
    git.enable = false;
    other.enable = false;
    ssh.enable = false;
    syncthing.enable = false;
  };

  # Do not change
  home.stateVersion = "24.11";
}
