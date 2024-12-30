{ inputs, ... }: {
  users.users.arne = {
    isNormalUser = true;
    description = "Arne von Laguna";
    extraGroups = [
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
      "libvirtd" 
    ];
  };

  home-manager = {
    users."arne" = {
      imports = [
				inputs.nixvim.homeManagerModules.nixvim
        ../homeModules
        ../homeModules/hypr
        ../homeModules/java.nix
      ];

      home.username = "arne";
      home.homeDirectory = "/home/arne";
    };
  };
}

