{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    fontconfig.defaultFonts = {
      monospace = [ "JetBrainsMono" ];
    };
  };

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
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # driSupport32Bit in 24.05
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-compute-runtime
    ];
  };


  services.xserver.enable = true;
}
