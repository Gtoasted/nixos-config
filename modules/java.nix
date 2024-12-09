{ pkgs, ... }: {
  home.packages = with pkgs; [
    gradle
    jdk21
  ];
}

