{ pkgs, sops, ... }: {
  imports = [
    ../system/fonts.nix
    ../system/locale.nix
  ];

  home-manager.users."arne".imports = [ ../system/git.nix ];

  #environment.systemPackages = pkgs.sops;
  services.openssh.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Secrets management
  sops.age.keyFile = "/home/arne/.config/sops/age/keys.txt";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do not change
  system.stateVersion = "23.11";
}
