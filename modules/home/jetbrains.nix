{ config, lib, pkgs, jetbrains-plugins, ...}: {
  options.gtoasted.jetbrains= {
    enable = lib.mkEnableOption "Enable Jetbrains programs.";
  };

  config = lib.mkIf config.gtoasted.jetbrains.enable {
		home.packages = let
      plg = jetbrains-plugins.idea-ultimate."2024.3.3"; 
      intellij = ( pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea-ultimate [
        # plg.IdeaVIM
        plg."com.intellij.spring"
        plg."com.intellij.spring.boot"
        plg."com.intellij.spring.boot.initializr"
        plg."org.jetbrains.plugins.spotbugs"
      ] );
    in with pkgs; [
      intellij
			gradle
			jdk21
		];
  };
}
