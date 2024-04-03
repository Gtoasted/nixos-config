# newModule/script.nix: Script for adding modules

{ pkgs, ... }: pkgs.writeShellApplication {
  name = "add-module";
  text = ''
    if [ $# = 1 ]; then
      cd /etc/nixos
      echo "# $1.nix

      { pkgs, lib, config, ... }: {
        options = {
          $1.enable = lib.mkEnableOption \"Enables $1\";
        };

        config = lib.mkIf config.$1.enable {
          environment.systemPackages = with pkgs; [
            $1
          ];
        };
      }" > modules/nixos/"$1".nix
      echo "Added nixos module $1. Please enable it if you wish to use it."
    else
      echo "Please provide exactly one package Name"
    fi
  '';
}
