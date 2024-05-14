# homeManagerModules/gui.nix: Modules which require a graphical user interface

{ pkgs, lib, ... }: {
  programs.firefox = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = lib.fileContents ./hypr/hyprland.conf;
  };
}
