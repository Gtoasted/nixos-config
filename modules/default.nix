{ ... }: {
  imports = [
    ./cli.nix
    ./neovim
    ./git.nix

    ./gui.nix
    ./firefox.nix

    ./latex.nix
    ./notex.nix
    ./style.nix
  ];
}
