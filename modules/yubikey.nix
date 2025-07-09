{ config, lib, pkgs, ...}: {
  options.gtoasted.yubikey = {
    enable = lib.mkEnableOption "support for yubikey.";
  };

  config = lib.mkIf config.gtoasted.yubikey.enable {
    services.udev.packages = with pkgs; [
      yubikey-personalization
    ];
    services.pcscd.enable = true;
    hardware.gpgSmartcards.enable = true;
    programs.gnupg = {
      agent.enable = true;
    };
    environment.systemPackages = with pkgs; [
      yubioath-flutter
      yubikey-personalization
      yubikey-manager
      libfido2
      opensc
    ];
  };
}
