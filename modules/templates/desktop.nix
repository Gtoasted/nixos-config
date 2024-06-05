{ ... }: {
  imports = [
    ./minimal.nix
    ../system/graphics.nix
    ../system/sound.nix
    ../system/printing.nix

    ../gui.nix
    ../cli.nix
    ../samba.nix

    ../latex.nix
  ];

   services.logind.powerKey = "suspend";
}
