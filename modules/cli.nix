{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    gradle
    wl-clipboard
    hyprshot
  ];

  programs.nh = {
    enable = true;
    flake = "/home/arne/.config/nixos/";
  };

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
