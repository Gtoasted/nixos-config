{ config, lib, zen, ...}: {
  options.gtoasted.zen = {
    enable = lib.mkEnableOption "Enable the Zen browser.";
  };

  config = lib.mkIf config.gtoasted.zen.enable {
    home.packages = [
      zen
    ];
  };
}
