{ config, lib, ... }:
{
  options.gtoasted.users.arne = {
    enable = lib.mkEnableOption "Enable user arne.";
  };

  config = lib.mkIf config.gtoasted.users.arne.enable {
    users.users.arne = {
      isNormalUser = true;
      description = "Arne von Laguna";
      extraGroups = [
        "networkmanager"
        "wheel"
        "scanner"
        "lp"
        "libvirtd"
      ];
    };

    home-manager = {
      users."arne" = {
        home.username = "arne";
        home.homeDirectory = "/home/arne";
        gtoasted = {
          ags.enable = true;
          communication.enable = true;
          documents.enable = true;
          hypr.enable = true;
          neovim.enable = true;
          firefox.enable = true;
          fun.enable = true;
          git.enable = true;
          librewolf.enable = true;
          mullvad-browser.enable = true;
          notex.enable = true;
          rice = {
            enable = true;
            stylix = true;
            home = false;
            gtk = true;
            qt = true;
          };
          sops.enable = false;
          ssh.enable = true;
          syncthing.enable = false;
          terminal.enable = true;
          tools.enable = true;
        };
      };
    };
  };
}
