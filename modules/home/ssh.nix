{
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
        hostname = "gtoasted.de";
        port = 55555;
        user = "arne";
      };
    };
  };
}
