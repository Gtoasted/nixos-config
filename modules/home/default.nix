{ specialArgs, ... }:
{
  home-manager = {
    extraSpecialArgs = specialArgs;
    sharedModules = [
      (
        { inputs, extraLib, ... }:
        {
          imports = (extraLib.getAllChildren ./.) ++ [
            inputs.nixvim.homeManagerModules.nixvim
            inputs.sops-nix.homeManagerModules.sops
          ];

          nixpkgs.config = {
            allowUnfreePredicate = _: true;
            allowUnfree = true;
          };

          programs.home-manager.enable = true;
        }
      )
    ];
  };
}
