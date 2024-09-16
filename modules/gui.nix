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
    libreoffice-qt
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    obsidian
  ];

  fonts.fontDir.enable = true;
}
