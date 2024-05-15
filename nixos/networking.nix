{ ... }: {
  networking = {
    hostName = "mugiwara";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [
        42000 # Warpinator
        42001 # Warpinator

        8384  # Syncthing
        22000 # Syncthing
      ];
      allowedUDPPorts = [
        42000 # Warpinator
        42001 # Warpinator

        22000 # Syncthing
        21027 # Syncthing
      ];
    };
  };
}
