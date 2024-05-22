# nixosModules/samba.nix: Mount cloud via samba

{ config, pkgs, sops, ... }: {
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  sops.secrets.samba = {
    format = "binary";
    sopsFile = ../secrets/samba;
  };

  fileSystems."/mnt/HiDrive" = {
    device = "//smb3.hidrive.strato.com/root/users/g96arne";
    fsType = "cifs";
    options = let
      automount_opts = "vers=3.0,x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/run/secrets/samba,uid=arne,gid=users"];
  };
}
