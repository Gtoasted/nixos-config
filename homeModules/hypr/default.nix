{ ... }: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprshot.nix
    ./dunst.nix
    ../waybar
    ../rofi
  ];
}
