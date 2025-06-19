{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
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
  };


  boot.kernelModules = [
    "ax88179_178a" # helpful for my ethernet to usb c adapter
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
  ];
  boot.supportedFilesystems.ntfs = true;
  boot.kernelParams = [
    "intel_iommu=on"
  ];
  programs.adb.enable = true;

  networking.hostName = "sol";

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
