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

      uutils-coreutils-noprefix
      ripgrep
      fd
      eza
      btop
    ];

    programs = {
      kitty.enable = true;

      fish = {
        enable = true;
        shellAbbrs = {
          ls = "eza";
          cd = "z";
          cat = "bat";
        };
      };
      bash = {
        enable = true;
        initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
        '';
      };

      starship = {
        enable = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
      bat.enable = true;
      zoxide = {
        enable = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
    };
  };
}
