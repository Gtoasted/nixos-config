{ config, lib, ...}: {
  options.gtoasted.gpg = {
    enable = lib.mkEnableOption "Enable gpg";
  };

  config = lib.mkIf config.gtoasted.gpg.enable {
    programs.gpg = {
      enable = true;
      scdaemonSettings = {
        disable-ccid = true;
      };
    };
  };
}
