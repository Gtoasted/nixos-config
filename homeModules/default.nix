{ ... }: {
  imports = [
    ./neovim
    ./git.nix

    ./firefox.nix

    ./notex.nix
    # ./style.nix

    ./other.nix
  ];
}
