{ config, lib, ...}: {
  options.gtoasted.fcast = {
    enable = lib.mkEnableOption "Enable fcast";
  };

  config = lib.mkIf config.gtoasted.fcast.enable {
    programs.fcast-receiver = {
      enable = true;
      openFirewall = true;
    };
  };
}
