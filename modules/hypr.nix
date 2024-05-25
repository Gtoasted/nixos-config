# nixosModules/hypr.nix: Nixos configuration for Hyprland

{ pkgs, lib, ... }: {
  imports = [
    ./system/x.nix
    ./waybar.nix
  ];
  home-manager.users."arne" = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;
      systemd.enable = true;
      extraConfig = lib.fileContents ../dotfiles/hypr/hyprland.conf;
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
	user = "arne";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wofi
  ];
}
