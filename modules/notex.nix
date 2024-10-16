{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python3
  ];

  environment.sessionVariables = {
    PATH = [
      "/home/arne/Sync/Uni/scripts/bin"
    ];
  };
}
