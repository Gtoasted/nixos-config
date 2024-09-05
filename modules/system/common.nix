{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    killall
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  users.users.arne = {
    isNormalUser = true;
    description = "Arne von Laguna";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
  };

  # locale
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

  nixpkgs.config.allowUnfree = true;
}
