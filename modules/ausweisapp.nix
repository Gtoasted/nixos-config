{ config, lib, ...}: {
  options.gtoasted.ausweisapp = {
    enable = lib.mkEnableOption "ausweisapp.";
  };

  config = lib.mkIf config.gtoasted.ausweisapp.enable {
    programs.ausweisapp = {
      enable = true;
      openFirewall = true;
    };
  };
}
