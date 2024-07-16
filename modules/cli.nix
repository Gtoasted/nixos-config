{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    gradle
    wl-clipboard
    hyprshot
  ];

  home-manager.users."arne" = {
    programs.vim.enable = true;
    
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    home = {
      file = { ".config/nvim".source = ../config/nvim; };
      sessionVariables.EDITOR = "nvim";
    };
  };
}
