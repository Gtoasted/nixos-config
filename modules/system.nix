{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.system = {
    enable = lib.mkEnableOption "Enable system configuration (it does a lot of stuff, you probably want it on).";
  };

  config = lib.mkIf config.gtoasted.system.enable {
    boot = {
      loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        grub = {
          enable = true;
          efiSupport = true;
          device = "nodev";
        };
      };
      supportedFilesystems = {
        ext2 = true;
      };
      kernelModules = [
        "sg" # Blu-ray support
        "snd_hda_intel" # Better mic hopefully
      ];
    };

    # Locale
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
      };
    };
    time.timeZone = "Europe/Berlin";

    # Keyboard layout
    services.xserver.xkb = {
      layout = "de";
      variant = "";
    };
    console.keyMap = "de";

    # External storage support
    services.devmon.enable = true;

    # For wireguard
    services.resolved.enable = true;

    # Sound
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      extraConfig.pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.allowed-rates" = [
              44100
              48000
            ];
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      qjackctl
    ];

    # ssh
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    # Printing & Scanning
    services.printing.enable = true;
    # Network printing
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    # Network Scanning
    hardware.sane.enable = true;

    # Authentication
    security.pam.services.hyprlock = {
      text = ''
        				auth sufficient pam_fprintd.so
        				auth include login
        			'';
    };

    # Power
    services.logind.powerKey = "suspend";
  };
}
