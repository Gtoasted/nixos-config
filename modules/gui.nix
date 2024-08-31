{ pkgs, ... }: {
  imports = [
    ./firefox.nix
  ];

  environment.systemPackages = with pkgs; [
    kitty
    dolphin
    xournalpp
    zathura
    thunderbird
    inkscape
    discord
    jetbrains-toolbox
    signal-desktop
    davinci-resolve
    vlc
    prismlauncher
    nwg-displays
    pavucontrol
  ];

  fonts.fontDir.enable = true;
}
