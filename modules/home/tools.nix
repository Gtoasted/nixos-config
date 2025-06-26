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
          };
          SSHAgent.Enabled = true;
          GUI = {
            AdvancedSettings = true;
            ApplicationTheme = "dark";
            HidePasswords = true;
            LaunchAtStartup = true;
          };
          FdoSecrets = {
            Enabled = config.gtoasted.hyprland.enable;
          };
        };
      };
    };

    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
