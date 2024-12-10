{ ... }: {
  programs.rofi.enable = true;

  home.file = {
    ".config/rofi".source = ./config;
  };
}
