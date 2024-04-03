# firefox.nix: Firefox installation and config

{ pkgs, lib, config, ... }: {
  options = {
    firefox.enable = lib.mkEnableOption "Enables firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        ExtensionSettings = {
          "*".installation_mode = "blocked";
          "ublock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
  };
}
