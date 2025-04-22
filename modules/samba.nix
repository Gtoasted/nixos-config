{ config, lib, ... }:
{
  options.gtoasted.samba = with lib; {
    enable = mkEnableOption "Enable samba.";
    mounts = mkOption {
      default = { };
      type = types.attrsOf (
        types.submodule (
          { name, ... }:
          {
            options = {
              enable = mkOption {
                type = types.bool;
                default = true;
              };
              path = mkOption {
                type = types.str;
                example = "/mnt/samba";
                default = name;
                description = "Local path to mount the share.";
              };
              device = mkOption {
                type = types.str;
                example = "//host/remote_path";
                description = "Remote device.";
              };
              credentialsFile = mkOption {
                type = types.str;
                example = "/run/secrets/samba";
                description = ''
                  File with credentials for the share. Must look like
                  username=xxx
                  password=yyy
                '';
              };
              user = mkOption {
                type = types.str;
                description = "The user to mount the share as";
              };
              group = mkOption {
                type = types.str;
                description = "The group to mount the share as";
              };
            };
          }
        )
      );
    };
  };

  config =
    let
      cfg = config.gtoasted.samba;
    in
    lib.mkIf cfg.enable {
      fileSystems = lib.mapAttrs' (
        name: mount:
        lib.nameValuePair mount.path {
          device = mount.device;
          fsType = "cifs";
          options = with mount; [
            "vers=3.0"
            "noauto"
            "_netdev"
            "x-systemd.automount"
            "x-systemd.idle-timeout=60"
            "x-systemd.device-timeout=5s"
            "x-systemd.mount-timeout=5s"
            "credentials=${credentialsFile}"
            "suid"
            "uid=${user}"
            "gid=${group}"
          ];
        }
      ) cfg.mounts;
    };
}
