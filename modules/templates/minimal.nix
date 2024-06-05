{ pkgs, ... }: {
  imports = [
    ../system/locale.nix
    ../system/git.nix
    ../system/ssh.nix
    ../system/sops.nix
    ../system/boot.nix
    ../system/user.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do not change
  system.stateVersion = "23.11";
}
