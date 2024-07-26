{ pkgs, ... }: {
  imports = [
    ./desktop.nix
    ../system/wifi.nix
    ../system/bluetooth.nix
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
    wpa_supplicant_gui
  ];
}
