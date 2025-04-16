{ config, lib, pkgs, ...}: {
  options.gtoasted.settings = with lib; {
    autostart = mkOption {
      default = [ ];
      example = [ "syncthing" ];
      type = types.listOf types.str;
      description = ''
        List of commands to be automatically executed on startup.
      '';
    };
    browser = mkOption {
      type = types.str;
      default = lib.getExe pkgs.firefox;
    };
  };

  config = let
    cfg = config.gtoasted.settings;
  in {
    gtoasted.hyprland.autostart = cfg.autostart;
    xdg.mimeApps.defaultApplications = let
      browser = "firefox";
    in {
      "text/html" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;
    };
  };
}
