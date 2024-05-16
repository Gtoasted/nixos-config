# homeManagerModules/hypr.nix: Hyprland and supplementary modules

{ pkgs, lib, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = lib.fileContents ../dotfiles/hypr/hyprland.conf;
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = lib.fileContents ../dotfiles/waybar/config;
  };
}

