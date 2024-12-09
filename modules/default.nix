{ ... }: {
  imports = [
    ./neovim
    ./git.nix

    ./media.nix
    ./firefox.nix

    ./notex.nix
    ./style.nix

    ./other.nix
  ];
}
