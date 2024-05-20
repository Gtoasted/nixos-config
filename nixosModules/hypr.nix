# nixosModules/hypr.nix: Nixos configuration for Hyprland

{ pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
	user = "arne";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wofi
  ];
}