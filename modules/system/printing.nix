{ ... }: {
  services.printing.enable = true;

  # Network printing
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
