{ config, lib, ...}: {
  options.gtoasted.wireguard = {
    enable = lib.mkEnableOption "Enable wireguard client.";
  };

  config = lib.mkIf config.gtoasted.wireguard.enable {
		sops.secrets = {
			wireguard_private = {
				format = "binary";
				sopsFile = ../secrets/wireguard_private;
			};

      wireguard_preshared = {
        format = "binary";
        sopsFile = ../secrets/wireguard_preshared;
      };
		};

    networking.wireguard.interfaces.wg0 =
      let
        secrets = config.sops.secrets;
      in {
        ips = [ "192.168.178.204/24" ];
        privateKeyFile = secrets.wireguard_private.path;
        # dns = [
        #   "192.168.178.1"
        #   "fritz.box"
        # ];

        peers = [
          {
            publicKey = "OYr2l1UtPx81nvCi2fZJ5P/tiHcs/pJQwy5dLfB4KyQ=";
            presharedKeyFile = secrets.wireguard_preshared.path;
            allowedIPs = [
              "192.168.178.0/24"
              "0.0.0.0/0"
            ];
            endpoint = "k47bwemqt3ribizg.myfritz.net:52363";
            persistentKeepalive = 25;
          }
        ];
    };
  };
}
