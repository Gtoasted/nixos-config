{ config, lib, ...}: {
  options.gtoasted.tailscale = {
    enable = lib.mkEnableOption "tailscale.";
  };

  config = lib.mkIf config.gtoasted.tailscale.enable {
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };
    networking.firewall = {
      checkReversePath = "loose";
      trustedInterfaces = [ "tailscale0" ];
    };
    services.resolved.enable = true;
  };
}
