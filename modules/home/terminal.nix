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
      btop
    ];

    programs = {
      kitty.enable = true;

      ripgrep.enable = true;
      fd.enable = true;
      eza = {
        enable = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
        icons = "auto";
        git = true;
      };
      btop.enable = true;
      fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
        shellAbbrs = {
          ls = "eza";
          cd = "z";
          cat = "bat";
          top = "btop";
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
