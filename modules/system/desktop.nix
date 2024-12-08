{ ... }: {
  imports = [
    ./graphics.nix
    ./sound.nix
    ./printing.nix
  ];

   services.logind.powerKey = "suspend";
}
