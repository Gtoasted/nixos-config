{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.rice = with lib; {
    enable = mkEnableOption "Enable autoricing.";
    stylix = mkEnableOption "Enable Stylix for home manager.";
    home = mkEnableOption "Enable home.pointerCursor config.";
    gtk = mkEnableOption "Enable gtk.";
    qt = mkEnableOption "Enable qt.";
  };

  config =
    let
      cfg = config.gtoasted.rice;
    in
    lib.mkIf cfg.enable {
      xdg.enable = true;

      stylix = lib.mkIf cfg.stylix {
        enable = true;
        iconTheme = {
          package = pkgs.kora-icon-theme;
          dark = "kora";
          light = "kora-light";
        };
        targets.qt = lib.mkIf cfg.qt {
          enable = true;
          platform = "adwaita";
        };
        targets.librewolf.profileNames = [
          "default"
        ];
      };

      home.pointerCursor = lib.mkIf cfg.home {
        gtk.enable = cfg.gtk;
        package = pkgs.catppuccin-cursors.mochaLight;
        name = "Catppuccin-Mocha-Light-Cursors";
        size = 16;
      };

      home.packages = [ pkgs.kora-icon-theme ];

      gtk = lib.mkIf cfg.gtk {
        enable = true;
        iconTheme = {
          name = "kora";
          package = pkgs.kora-icon-theme;
        };
      };
    };
}
