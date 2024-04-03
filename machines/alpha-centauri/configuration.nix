# machines/alpha-centauri/configuration.nix: The NixOS config file for my laptop, which I have named alpha-centauri

{ pkgs, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ../base.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  networking.hostName = "alpha-centauri"; # Define your hostname.

  environment.shellAliases= {
    "rebuild-switch" = "nixos-rebuild switch --flake /etc/nixos#alpha-centauri";
    "rebuild-test" = "nixos-rebuild test --flake /etc/nixos#alpha-centauri";
  };

  # Home Manager config
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."arne" = {
      imports = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
