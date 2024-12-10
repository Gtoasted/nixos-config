{ pkgs, sops, ... }: {
  environment.systemPackages = [
    pkgs.sops
  ];
  sops.age.keyFile = "/home/arne/.config/sops/age/keys.txt";
}
