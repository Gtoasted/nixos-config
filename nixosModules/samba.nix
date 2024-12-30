{ config, lib, pkgs, ... }: {
	options.gtoasted.sambda = {
		enable = lib.mkEnableOption "Enable mounting HiDrive cloud with cifs/sambda.";
	};

	config = {
		environment.systemPackages = with pkgs; [
			cifs-utils
		];

		sops.secrets.samba = {
			format = "binary";
			sopsFile = ../secrets/samba;
		};

		fileSystems."/mnt/HiDrive" = {
			device = "//smb.hidrive.strato.com/root/users/g96arne";
			fsType = "cifs";
			options = let
				automount_opts = "vers=3.0,x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
			in ["${automount_opts},credentials=${config.sops.secrets.samba.path},uid=arne,gid=users"];
		};
	};
}
