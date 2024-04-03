# vim.nix

{ pkgs, lib, config, ... }: {
  options = {
    vim.enable = lib.mkEnableOption "Enables vim";
  };

  config = lib.mkIf config.vim.enable {
    programs.vim = {
      enable = true;
    };
  };
}

