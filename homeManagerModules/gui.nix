# homeManagerModules/gui.nix: Modules which require a graphical user interface

{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
  };
}
