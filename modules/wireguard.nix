{ config, lib, ...}: {
  options.gtoasted.wireguard = with lib; {
    enable = mkEnableOption "Enable wireguard client.";
    secrets = {
      private = mkOption {
        example = "/run/secrets/wifi";
        type = types.str;
        description = "Path to the private key for wireguard.";
      };
      preshared = mkOption {
        type = types.str;
        description = "Path to the preshared key for wireguard";
      };
    };
  };

  config = lib.mkIf config.gtoasted.wireguard.enable {

    networking.wireguard.interfaces.wg0 =
      let
        secrets = config.gtoasted.wireguard.secrets;
      in {
        ips = [ "192.168.178.204/24" ];
        privateKeyFile = secrets.private;

        peers = [
          {
            publicKey = "OYr2l1UtPx81nvCi2fZJ5P/tiHcs/pJQwy5dLfB4KyQ=";
            presharedKeyFile = secrets.preshared;
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
