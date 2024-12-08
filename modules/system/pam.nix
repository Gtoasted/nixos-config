{ ... }: {
  security.pam.services.hyprlock = {
    text = ''
      auth sufficient pam_fprintd.so
      auth include login
    '';
  };
}
