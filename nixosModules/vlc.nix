{ pkgs, ...}: {
  environment.systemPackages = let 
    # libbluray = pkgs.libbluray.override {
    #   withAACS = true;
    #   # withBDplus = true;
    #   withJava = true;
    # };
    # vlc = pkgs.vlc.override {
    #   inherit libbluray;
    # };
  in with pkgs; [
    vlc
    makemkv
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      makemkv
    ];
  };
}

