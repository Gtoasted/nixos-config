{ pkgs, ... }: {
  home.packages = with pkgs; [
    python3
  ];

  home.sessionVariables = {
    PATH = "/home/arne/Sync/Uni/scripts/bin";
  };
}
