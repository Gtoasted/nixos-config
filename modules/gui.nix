{ pkgs, ... }: {
  imports = [
    ./firefox.nix
  ];

  environment.systemPackages = with pkgs; [
    kitty
    dolphin
    xournalpp
    zathura
  ];
}
