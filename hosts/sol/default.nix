{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  gtoasted.kde.enable = true;
  gtoasted.hyprland.enable = false;
  gtoasted.steam.enable = true;
  gtoasted.samba = {
    enable = true;
    mounts."/mnt/HiDrive" = {
      device = "//smb.hidrive.strato.com/root/users/g96arne";
      credentialsFile = config.sops.secrets.hidrive.path;
      user = "arne";
      group = "users";
    };
  };
  gtoasted.nvidia.enable = false;
  gtoasted.graphics.nvidia = true;

  networking.hostName = "sol";

  # Do not change these
  system.stateVersion = "24.11";
  home-manager = {
    sharedModules = [
      {
        home.stateVersion = "24.11";
        gtoasted.hypr.enable = lib.mkForce false;
      }
    ];
  };
}
