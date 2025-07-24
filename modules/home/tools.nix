{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.tools = {
    enable = lib.mkEnableOption "Enable some management tools.";
  };

  config = lib.mkIf config.gtoasted.tools.enable {
    home.packages = with pkgs; [
      nwg-displays
      pavucontrol
      kdePackages.dolphin
    ];

    programs = {
      yazi = {
        enable = true;
        enableFishIntegration = true;
      };
      keepassxc = {
        enable = true;
        settings = {
          Browser = {
            Enabled = true;
            AlwaysAllowAccess = true;
            UpdateBinaryPath = false;
          };
          SSHAgent.Enabled = true;
          GUI = {
            AdvancedSettings = true;
            ApplicationTheme = "dark";
            HidePasswords = true;
            ShowTrayIcon = true;
            MinimizeToTray = true;
            MinimizeOnStartup = true;
            MinimizeOnClose = true;
          };
          Security = {
            IconDownloadFallback = true;
          };
          FdoSecrets = {
            Enabled = config.gtoasted.hyprland.enable;
            ConfirmAccessItem = false;
          };
        };
      };
    };

    gtoasted.settings.autostart = lib.singleton
      (lib.getExe config.programs.keepassxc.package);

    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
