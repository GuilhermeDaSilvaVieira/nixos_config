{ ... }: {
  # Enable networking to printer
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
