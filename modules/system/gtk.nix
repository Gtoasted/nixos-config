{ pkgs, ... }: {
  programs.dconf.enable = true;
  
  home-manager.users."arne" = {
    gtk = {
      enable = true;
      theme = {
        package = pkgs.dracula-theme;
        name = "Dracula";
      };
      iconTheme = {
        package = pkgs.kora-icon-theme;
        name = "Kora";
      };
    };

    home.pointerCursor = {
      gtk.enable = true;
      name = "Catppuccin-Mocha-Light-Cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
      size = 16;
    };
  };
}
