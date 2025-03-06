{ config, lib, pkgs, ...}: {
  options.gtoasted.stylix = {
    enable = lib.mkEnableOption "Enable Stylix for home manager.";
  };

  config = lib.mkIf config.gtoasted.stylix.enable {
  };
}
