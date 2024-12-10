{ pkgs, ... }: {
  # fonts = {
  #   enableDefaultPackages = true;
  #   fontconfig.enable = true;
  #
  #   packages = with pkgs; [
  #     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  #   ];
  #
  #   fontconfig.defaultFonts = {
  #     monospace = [ "JetBrainsMono" ];
  #   };
  # };
  # fonts.fontDir.enable = true;

  programs.dconf.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # driSupport32Bit in 24.05
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-compute-runtime
    ];
  };

  services.xserver.enable = true;
}
