{ inputs, outputs, ... }: {
  # Enable networking to printer
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
