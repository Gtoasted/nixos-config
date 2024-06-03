{ pkgs, ... }: {
  programs.dconf.enable = true;
  
  home-manager.users."arne" = {
    gtk = {
      enable = true;
      theme = {
        package = pkgs.dracula-theme;
        name = "Dracula";
      };
    };
  };
}
