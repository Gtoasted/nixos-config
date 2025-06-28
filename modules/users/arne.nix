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
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyGYjjrEqK5Z6fh/lS54c1elbfSMOZ/NXjfuKc5Vo84JEOkvBf2MeCDtW+bo4bS2NBBgXJODDBTZ56IqJZlc+LOqHg9dtZdNCEA/R6EtzGyf/uChSkLrQt6Wte9Svv2HykQawzCxG4fFGyK0acajX9dypqXR5uk/OohDipyY6EBB692dCqru3CkINbWi2NE4zXXqJuwO/JEk5Ywo/41nDZv4fgXmf91lBdjZYF6iA1F9l0PuPqo02/zuKoFcgh2OQUAkVkE0qB1QXvOxyjgxhOSvf1wCuaC69FRblW7wftT+hoxAOWy3LOoeFAd8V7eCEf4cFWsPeylo9FpYW9t02tjKuXfahmBlBT+Q0QDhsxf7FEwFAK+9iWDMhp3v9sMOs/Wsh8lpvAA1qR54pMuT35QigQ9qTXQb1qRw476/hhopngoQ10rAQPfI+XNUk/aiakhx08LmlgqsK1nNiNB42UKL3TSWAOu9jRArWTH2pL56jmGw/wKOs1geXbtT7Psec= (encrypted)"
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
