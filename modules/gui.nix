{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kitty
    vim
    neovim
  ];

  home-manager.users."arne" = {
    programs.firefox = {
      enable = true;
    };
  };
}
