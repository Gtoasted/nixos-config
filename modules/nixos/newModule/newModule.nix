# newModule.nix: module that adds new modules

{ pkgs, lib, config, ... }: {
  options = {
    newModule.enable = lib.mkEnableOption "Enables newModule";
  };

  config = lib.mkIf config.newModule.enable {
    environment.systemPackages = with pkgs; [
      (import ./script.nix { inherit pkgs; })
    ];
  };
}
