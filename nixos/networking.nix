{ ... }: {
  networking = {
    hostName = "zoro";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [
        42000 # Warpinator
        42001 # Warpinator
      ];
      allowedUDPPorts = [
        42000 # Warpinator
        42001 # Warpinator
      ];
    };
  };
}
