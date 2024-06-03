{ pkgs, inputs, ... }: {
  home-manager.users."arne" = {
    programs.vim.enable = true;
    
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    home = {
      file = { ".config/nvim".source = "${inputs.nvim-config}"; };
      sessionVariables.EDITOR = "nvim";
    };
  };
}
