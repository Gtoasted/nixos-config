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
    gimp
    discord
    jetbrains-toolbox
    signal-desktop
    # davinci-resolve
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
  programs.steam.enable = true;

  home-manager.users."arne".xdg = {
    desktopEntries.zathura = {
      name = "Zathura";
      exec = "${pkgs.zathura}/bin/zathura";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "zathura.desktop";
      };
    };
  };
}
