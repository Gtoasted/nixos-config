{ ... }:

{
  imports = [
    ./git.nix
    ./firefox.nix
    ./vim.nix
  ];
  
  git.enable = true;
  firefox.enable = true;
  vim.enable = true;
}
