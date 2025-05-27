{ config, lib, pkgs, ...}: {
  options.gtoasted.gpg = {
    enable = lib.mkEnableOption "Enable gpg.";
  };

  config = lib.mkIf config.gtoasted.gpg.enable {
    services.udev.packages = with pkgs; [
      yubikey-personalization
    ];
    services.pcscd.enable = true;
    programs.gnupg.agent = {
      enable = true;
    };
  };
}
