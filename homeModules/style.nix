{ pkgs, ... }: {
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
    cursorTheme = {
      name = "Catppuccin-Mocha-Light-Cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.mochaLight;
    name = "Catppuccin-Mocha-Light-Cursors";
    size = 16;
  };
}
