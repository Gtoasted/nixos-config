{ config, lib, pkgs, ...}: {
  options.gtoasted.sops = {
    enable = lib.mkEnableOption "Enable secret management with sops-nix.";
  };

  config = lib.mkIf config.gtoasted.sops.enable {
		environment.systemPackages = [ pkgs.sops ];
		sops.age.keyFile = "/home/arne/.config/sops/age/keys.txt";

		sops.secrets = {
			wifi = {
				format = "binary";
				sopsFile = ./wifi;
			};

      easyroam = {
        format = "binary";
        sopsFile = ./easyroam;
      };

			wireguard_private = {
				format = "binary";
				sopsFile = ./wireguard_private;
			};

      wireguard_preshared = {
        format = "binary";
        sopsFile = ./wireguard_preshared;
      };

      hidrive = {
        format = "binary";
        sopsFile = ./hidrive;
      };
		};

    gtoasted = with config.sops.secrets; {
      laptop.secrets = {
        wifi = wifi.path;
        easyroam = easyroam.path;
      };
      wireguard.secrets = {
        private = wireguard_private.path;
        preshared = wireguard_preshared.path;
      };
    };
  };
}
