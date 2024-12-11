{ pkgs, ... }: {
  stylix.targets.hyprlock.enable = false;

  programs.hyprlock = {
    enable = true;
    settings = {
      "$text_color" = "rgba(FFFFFFFF)";
      "$entry_background_color" = "rgba(33333311)";
      "$entry_border_color" = "rgba(3B3B3B55)";
      "$entry_color" = "rgba(FFFFFFFF)";
      "$font_family" = "Rubik Light";
      "$font_family_clock" = "Rubik Light";
      "$font_material_symbols" = "Material Symbols Rounded";

      background = {
        path = "~/.config/hypr/m87.png";
        color = "rgba(0)";
      };

      input-field = {
        monitor = "";
        size = "250, 50";
        outline_thickness = 2;
        dots_size = 0.1;
        dots_spacing = 0.3;
        outer_color = "$entry_border_color";
        inner_color = "$entry_background_color";
        font_color = "$entry_color";
        fade_on_empty = true;

        position = "0, 100";
        halign = "center";
        valign = "bottom";
      };

      label = { # Clock
          monitor = "";
          text = "$TIME";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "$text_color";
          font_size = 130;
          font_family = "$font_family_clock";

          position = "0, -50";
          halign = "center";
          valign = "top";
      };
    };
  };
  home.file = {
    ".config/hypr/m87.png".source = ./config/m87.png;
  };
}
