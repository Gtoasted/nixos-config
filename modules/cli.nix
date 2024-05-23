{ ... }: {
  home-manager.users."arne" = {
    programs.vim.enable = true;
    
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
