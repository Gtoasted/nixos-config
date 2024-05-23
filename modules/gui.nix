{ ... }: {
  home-manager.users."arne" = {
    programs.firefox = {
      enable = true;
    };
  };
}
