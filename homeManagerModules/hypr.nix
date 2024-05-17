# homeManagerModules/hypr.nix: Hyprland and supplementary modules

{ pkgs, lib, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = lib.fileContents ../dotfiles/hypr/hyprland.conf;
  };

#  services.mako.enable = true;

  home.file = {
#    ".config/waybar/colors.css".source = ../dotfiles/waybar/colors.css;
#    ".config/waybar/style.css".source = ../dotfiles/waybar/style.css;
#    ".config/waybar/scripts".source = ../dotfiles/waybar/scripts;
    ".config/waybar/shared-modules.json".source = ../dotfiles/waybar/shared-modules.json;
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = lib.importJSON ../dotfiles/waybar/config;
  };
}

