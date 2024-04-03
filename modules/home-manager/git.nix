# git.nix: Git installation and config

{ pkgs, lib, config, ... }: {

  options = {
    git.enable = lib.mkEnableOption "Enables Git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Gtoasted";
      userEmail = "arne@vonlaguna.de";
      extraConfig.safe.directory = "/etc/nixos";
    };

    home.file.".ssh/id_ed25519.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJRrAjXZxC1ORzTB9Br6bY/7EX8qek3mSCOptlH8NKeZ arne@vonlaguna.de";
  };
}
