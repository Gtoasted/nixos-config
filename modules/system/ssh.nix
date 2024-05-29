{ sops, ... }: {
  sops.secrets = {
    ssh_secret = {
      format = "binary";
      sopsFile = ../../secrets/id_ed25519;
      owner = "arne";
      group = "users";
    };

    ssh_public = {
      format = "binary";
      sopsFile = ../../secrets/id_ed25519.pub;
      owner = "arne";
      group = "users";
    };
  };

  services.openssh.enable = true;

  home-manager.users."arne" = {
    home.file = {
      ".ssh/id_ed25519".source = /run/secrets/ssh_secret;
      ".ssh/id_ed25519.pub".source = /run/secrets/ssh_public;
    };
  };
}
