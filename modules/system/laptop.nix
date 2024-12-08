{ pkgs, ... }: {
  imports = [
    ./desktop.nix
    ./wifi.nix
    ./bluetooth.nix
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
