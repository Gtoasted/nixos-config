{ config, lib, pkgs, ...}: {
  options.gtoasted.sops = {
    enable = lib.mkEnableOption "Enable secret management with sops-nix.";
  };

  config = lib.mkIf config.gtoasted.sops.enable {
		environment.systemPackages = [ pkgs.sops ];
		sops.age.keyFile = "/home/arne/.config/sops/age/keys.txt";
  };
}
