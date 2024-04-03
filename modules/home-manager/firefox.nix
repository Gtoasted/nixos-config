# firefox.nix: Firefox installation and config

{ pkgs, lib, config, ... }: {
  options = {
    firefox.enable = lib.mkEnableOption "Enables firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
