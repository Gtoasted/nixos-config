# nixosModules/system.nix: configuration that is neccessary for the system to function properly

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sops
    wget
  ];
  
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono" ];
  };
}
