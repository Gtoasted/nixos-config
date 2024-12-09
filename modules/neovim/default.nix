{ ... }: {
  programs.vim.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home = {
    file = { ".config/nvim".source = ./config; };
    sessionVariables.EDITOR = "nvim";
  };
}
