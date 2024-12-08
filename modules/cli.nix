{ pkgs, ... }: {
  home.packages = with pkgs; [
    gradle
    jdk21
    wl-clipboard
    hyprshot
    zip
    unzip
  ];

  programs.vim.enable = true;
}
