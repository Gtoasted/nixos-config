{ inputs, pkgs, lib, ... }: {
  imports = [
    ./waybar.nix
  ];

  environment.systemPackages = with pkgs; [
    wofi
    hypridle
    hyprlock
    xdg-desktop-portal-hyprland
    cliphist
  ];

  home-manager.users."arne" = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      # plugins = [
      #   inputs.hyprgrass.packages.${pkgs.system}.default
      # ];
      xwayland.enable = true;
      systemd.enable = true;
      extraConfig = lib.fileContents ../config/hypr/hyprland.conf;
    };

    services.mako = {
      enable = true;
      extraConfig = lib.fileContents ../config/mako/config;
    };

    home.file = {
      ".config/hypr/hyprlock.conf".source = ../config/hypr/hyprlock.conf;
      ".config/hypr/hypridle.conf".source = ../config/hypr/hypridle.conf;
      ".config/hypr/m87.png".source = ../config/hypr/m87.png;
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

  security.pam.services.hyprlock = {
    text = ''
      auth sufficient pam_fprintd.so
      auth include login
    '';
  };
}
