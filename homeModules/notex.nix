{ pkgs, ... }: {
  home.packages = with pkgs; [
    python3
  ];

  home.sessionPath = [
    "/home/arne/Sync/Uni/scripts/bin"
  ];
}
