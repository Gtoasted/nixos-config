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
				sopsFile = ../secrets/wifi;
			};

      easyroam = {
        format = "binary";
        sopsFile = ../secrets/easyroam;
      };

			wireguard_private = {
				format = "binary";
				sopsFile = ../secrets/wireguard_private;
			};

      wireguard_preshared = {
        format = "binary";
        sopsFile = ../secrets/wireguard_preshared;
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
