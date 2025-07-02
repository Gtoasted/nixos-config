{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./gpu-passthrough.nix
    ../../modules
  ];

  gtoasted = {
    kde.enable = true;
    hyprland.enable = false;
    steam.enable = true;
    samba = {
      enable = true;
      mounts."/mnt/HiDrive" = {
        device = "//smb.hidrive.strato.com/root/users/g96arne";
        credentialsFile = config.sops.secrets.hidrive.path;
        user = "arne";
        group = "users";
      };
    };
    nvidia.enable = false;
    graphics.nvidia = true;
    fcast.enable = true;
    virtualisation.enable = true;
    gpu-passthrough.enable = true;
  };

  boot = {
    kernelModules = [
      "ax88179_178a" # helpful for my ethernet to usb c adapter
    ];
    supportedFilesystems.ntfs = true;
    loader.grub.useOSProber = true;
  };

  programs.adb.enable = true;

  networking.hostName = "sol-mars";

  # Do not change these
  system.stateVersion = "25.05";
  home-manager = {
    sharedModules = [
      {
        home.stateVersion = "25.05";
        gtoasted.hypr.enable = lib.mkForce false;
      }
    ];
  };
}
