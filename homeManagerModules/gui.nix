# homeManagerModules/gui.nix: Modules which require a graphical user interface

{ pkgs, lib, ... }: {
  programs.firefox = {
    enable = true;
  };
}
