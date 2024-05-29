{ ... }: {
  imports = [
    ./minimal.nix
    ../system/printing.nix
    ../system/sound.nix

    ../gui.nix
    ../cli.nix
    ../samba.nix

    ../latex.nix
    ../zathura.nix
  ];
}
