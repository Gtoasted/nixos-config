# homeManagerModules/hypr.nix: Hyprland and supplementary modules

{ pkgs, lib, ... }: {
  imports = [
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = lib.fileContents ../dotfiles/hypr/hyprland.conf;
  };
}

