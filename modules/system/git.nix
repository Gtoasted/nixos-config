{ ... }: {
  home-manager.users."arne" = {
    programs.git = {
      enable = true;
      userName = "Gtoasted";
      userEmail = "arne@vonlaguna.de";
    };
  };
}
