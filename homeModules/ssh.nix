{ config, lib, ... }: {
	options.gtoasted.ssh = {
		enable = lib.mkEnableOption "Enable ssh client.";
	};

	config = lib.mkIf config.gtoasted.ssh.enable {
		sops.secrets = {
			ssh_secret = {
				format = "binary";
				sopsFile = ../secrets/id_ed25519;
				mode = "0700";
				path = ".ssh/id_ed25519";
			};

			ssh_public = {
				format = "binary";
				sopsFile = ../secrets/id_ed25519.pub;
				mode = "0700";
				path = ".ssh/id_ed25519.pub";
			};
		};

    programs.ssh.enable = true;
    services.ssh-agent.enable = true;
	};
}
