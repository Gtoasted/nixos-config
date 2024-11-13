{ config, sops, pkgs, ... }: {
  sops.secrets.wifi = {
    format = "binary";
    sopsFile = ../../secrets/wifi;
  };

  environment.systemPackages = [
    pkgs.easyroam
  ];

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
      };
    };
  };
}
