{ pkgs, ... }: {
  imports = [
    ./desktop.nix
    ../system/wifi.nix
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
