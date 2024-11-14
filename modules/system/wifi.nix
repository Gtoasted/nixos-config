{ config, sops, pkgs, ... }: {
  sops.secrets = {
    wifi = {
      format = "binary";
      sopsFile = ../../secrets/wifi;
    };

    easyroam_client_cert = {
      format = "binary";
      sopsFile = ../../secrets/easyroam_client_cert.pem;
    };

    easyroam_client_key = {
      format = "binary";
      sopsFile = ../../secrets/easyroam_client_key.pem;
    };

    easyroam_root_ca = {
      format = "binary";
      sopsFile = ../../secrets/easyroam_root_ca.pem;
    };
  };

  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    secretsFile = /run/secrets/wifi;
    networks = {
      Sagittarius.pskRaw = "ext:sagittarius";
      Gommemode.pskRaw = "ext:gommemode";
      G96.pskRaw = "ext:g96";
      LambdaAufDemEFeld.pskRaw = "ext:lambdaaufdemefeld";
      "The promised LAN".pskRaw = "ext:thepromisedlan";
      "Vodafone-5AE1".pskRaw = "ext:vodafone5ae1";
      "Gastzugang Marienhof".pskRaw = "ext:gastzugangmarienhof";
      eduroam.auth = ''
        key_mgmt=WPA-EAP
        proto=WPA2
        eap=TLS
        pairwise=CCMP
        group=CCMP
        identity="1122784270474415738@easyroam-pca.uni-duesseldorf.de"
        altsubject_match="DNS:easyroam.eduroam.de"
        ca_cert="/run/secrets/easyroam_root_ca"
        client_cert="/run/secrets/easyroam_client_cert"
        private_key="/run/secrets/easyroam_client_key"
        private_key_passwd=""
      '';
    };
  };
}
