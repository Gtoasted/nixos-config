{ config, lib, ...}: {
  options.gtoasted.settings = with lib; {
    autostart = mkOption {
      default = [ ];
      example = [ "syncthing" ];
      type = types.listOf types.str;
      description = ''
        List of commands to be automatically executed on startup.
      '';
    };
  };

  config = let
    cfg = config.gtoasted.settings;
  in {
    gtoasted.hyprland.autostart = cfg.autostart;
  };
}
