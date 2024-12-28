pkgs: {
  easyroam = pkgs.callPackage ./easyroam.nix { };
  vlc-makemkv = pkgs.callPackage ./vlc.nix { };
}
