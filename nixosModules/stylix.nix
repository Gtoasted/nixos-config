{ pkgs, stylix, ... }: {
  stylix = {
    enable = true;

    image = ../assets/vaporwave.jpg;
    imageScalingMode = "center";

    cursor = {
      package = pkgs.catppuccin-cursors.mochaLight;
      name = "Catppuccin-Mocha-Light-Cursors";
      size = 16;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono";
      };
    };

    targets = {
      grub.enable = false;
    };
  };
}
