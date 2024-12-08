{ ... }: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./dunst.nix
    ../waybar
    ../rofi
  ];
}
