{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kitty
    dolphin
  ];

  home-manager.users."arne" = {
    programs.firefox = {
      enable = true;
    };
  };
}
