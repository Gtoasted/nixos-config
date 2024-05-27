{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kitty
  ];

  home-manager.users."arne" = {
    programs.firefox = {
      enable = true;
    };
  };
}
