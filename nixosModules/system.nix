{ config, pkgs,... }: {
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
    kernelModules = [ "sg" ]; # Blu-ray support
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

  # Sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Graphics
  programs.dconf.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # driSupport32Bit in 24.05
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-compute-runtime
    ];
  };
  services.xserver.enable = true;

  # ssh
  sops.secrets = {
    ssh_secret = {
      format = "binary";
      sopsFile = ../secrets/id_ed25519;
      owner = "arne";
      group = "users";
    };

    ssh_public = {
      format = "binary";
      sopsFile = ../secrets/id_ed25519.pub;
      owner = "arne";
      group = "users";
    };
  };

  services.openssh.enable = true;

  # This is a cardinal sin
  home-manager.users."arne" = {
    home.file = {
      ".ssh/id_ed25519".source = config.sops.secrets.ssh_secret.path;
      ".ssh/id_ed25519.pub".source = config.sops.secrets.ssh_public.path;
    };
  };

  # sops
  environment.systemPackages = [
    pkgs.sops
  ];
  sops.age.keyFile = "/home/arne/.config/sops/age/keys.txt";

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
}
