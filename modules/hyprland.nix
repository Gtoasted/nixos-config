{ pkgs, lib, ... }: {
  imports = [
    ./system/x.nix
    ./waybar.nix
  ];

  environment.systemPackages = with pkgs; [
    wofi
    swayidle
    swaylock-effects
    hyprlock
  ];

  home-manager.users."arne" = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;
      systemd.enable = true;
      extraConfig = lib.fileContents ../dotfiles/hypr/hyprland.conf;
    };

    home.file = {
      ".config/swayidle/config".source = ../dotfiles/swayidle/config;
      ".config/hypr/hyprlock.conf".source = ../dotfiles/hypr/hyprlock.conf;
      # ".config/hypr/hyprlock".source = ../dotfiles/hypr/hyprlock;
      ".config/hypr/m87.png".source = ../dotfiles/hypr/m87.png;
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
