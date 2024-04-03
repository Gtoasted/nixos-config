# keepassxc.nix

  { pkgs, lib, config, ... }: {
    options = {
      keepassxc.enable = lib.mkEnableOption "Enables keepassxc";
    };

    config = lib.mkIf config.keepassxc.enable {
      environment.systemPackages = with pkgs; [
        keepassxc
      ];
    };
  }
