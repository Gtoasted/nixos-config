{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.terminal = {
    enable = lib.mkEnableOption "Enable terminal-related programs.";
  };

  config = lib.mkIf config.gtoasted.terminal.enable {
    home.packages = with pkgs; [
      wl-clipboard
      zip
      unzip
    ];

    programs = {
      bash.enable = true;
      kitty.enable = true;
      starship = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}
