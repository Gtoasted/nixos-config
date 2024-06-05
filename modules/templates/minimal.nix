{ pkgs, ... }: {
  imports = [
    ../system/common.nix
    ../system/sops.nix
    ../system/git.nix
    ../system/ssh.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do not change
  system.stateVersion = "23.11";
}
