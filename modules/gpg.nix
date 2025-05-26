{ config, lib, ...}: {
  options.gtoasted.gpg = {
    enable = lib.mkEnableOption "Enable gpg.";
  };

  config = lib.mkIf config.gtoasted.gpg.enable {
    services.pcscd.enable = true;
    programs.gnupg.agent = {
      enable = true;
    };
  };
}
