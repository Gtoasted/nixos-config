{ config, lib, pkgs, ...}: {
  options.gtoasted.mullvad-browser = {
    enable = lib.mkEnableOption "Enable mullvad browser.";
  };

  config = lib.mkIf config.gtoasted.mullvad-browser.enable {
    home.packages = [
      pkgs.mullvad-browser
    ];
  };
}
