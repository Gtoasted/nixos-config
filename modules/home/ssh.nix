{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.gtoasted.ssh = {
    enable = lib.mkEnableOption "Enable ssh client.";
  };

  config = lib.mkIf config.gtoasted.ssh.enable {
    services.ssh-agent.enable = true;

    programs.ssh = {
      enable = true;
      matchBlocks.arcalis = {
        proxyCommand = "${lib.getExe pkgs.cloudflared} access ssh --hostname ssh-arcalis.gtoasted.de";
        user = "arne";
      };
    };
  };
}
