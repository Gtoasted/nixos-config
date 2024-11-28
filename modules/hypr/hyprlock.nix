{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    hyprlock
  ];

  home-manager.users."arne".home.file = {
    ".config/hypr/hyprlock.conf".source = ../../config/hypr/hyprlock.conf;
    ".config/hypr/m87.png".source = ../../config/hypr/m87.png;
  };

  security.pam.services.hyprlock = {
    text = ''
      auth sufficient pam_fprintd.so
      auth include login
    '';
  };
}
