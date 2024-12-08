{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
    dolphin
    xournalpp
    thunderbird
    inkscape
    gimp
    discord
    jetbrains-toolbox
    signal-desktop
    vlc
    prismlauncher
    nwg-displays
    pavucontrol
    libreoffice-qt
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    obsidian
    element-desktop
    pdfpc
  ];

  programs.bash.enable = true;

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zathura = {
    enable = true;
    options = {
      window-title-basename = true;
    };
  };

  xdg = {
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
