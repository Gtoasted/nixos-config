{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    cliphist
  ];

  home-manager.users."arne".home.file = {
    ".config/hypr/hypridle.conf".source = ../../config/hypr/hypridle.conf;
    ".config/hypr/m87.png".source = ../../config/hypr/m87.png;
  };
}
