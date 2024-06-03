{ pkgs, lib, ... }: {
  imports = [
    ./system/x.nix
    ./waybar.nix
  ];

  environment.systemPackages = with pkgs; [
    wofi
    swayidle
    swaylock-effects
  ];

  home-manager.users."arne" = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;
      systemd.enable = true;
      extraConfig = lib.fileContents ../dotfiles/hyprland/hyprland.conf;
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

  security.pam.services.swaylock = {
    text = ''
      auth sufficient pam_fprintd.so
      auth include login
    '';
  };
}
