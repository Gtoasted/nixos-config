{ config, lib, pkgs, ... }: {
  # TODO: Modularise
	options.gtoasted.samba = with lib; {
		enable = mkEnableOption "Enable samba.";
    # drives = mkOption {
    #   type = types.attrsOf types.attrsOf types.str;
    #   default = { };
    #   example = {
    #     hidrive = {
    #       path = "/mnt/HiDrive";
    #       device = "//smb.hidrive.strato.com/root/users/g96arne";
    #       credentials = "/run/secrets/samba";
    #     };
    #   };
    #   description = "Set of sets of path (local) and device (remote) to be mounted.";
    # };
	};

	config = lib.mkIf config.gtoasted.samba.enable {
		environment.systemPackages = with pkgs; [
			cifs-utils
		];

		sops.secrets.samba = {
			format = "binary";
			sopsFile = ../secrets/samba;
		};

		fileSystems."/mnt/movies" = {
			device = "//arcalis/movies";
			fsType = "cifs";
			options = let
				automount_opts = "vers=3.0,x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
			in ["${automount_opts},credentials=${config.sops.secrets.samba.path},uid=arne,gid=users"];
		};
	};
}
