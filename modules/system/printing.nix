{ ... }: {
  services.printing.enable = true;

  # Network printing
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
