{ ... }: {
  users.users.arne = {
    isNormalUser = true;
    description = "Arne von Laguna";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
