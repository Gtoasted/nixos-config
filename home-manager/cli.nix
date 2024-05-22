# homeManagerModules/cli.nix: Command line modules

{ pkgs, lib, config, ... }: {
  programs.vim.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
