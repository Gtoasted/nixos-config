{ ... }: {
  sops.secrets.wifi = {
    format = "binary";
    sopsFile = ../secrets/wifi;
  };

  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    environmentFile = /run/secrects/wifi;
    networks = {
      Sagittarius = {
        psk = "@sagittarius";
      };
    };
  };
}
