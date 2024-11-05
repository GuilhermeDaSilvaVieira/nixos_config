{ ... }:
{
  networking = {
    hostName = "mugiwara";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [
        # Syncthing
        8384
        22000

        # LocalSend
        53317
      ];
      allowedUDPPorts = [
        # Syncthing
        22000
        21027

        # LocalSend
        53317
      ];
    };
  };
}
