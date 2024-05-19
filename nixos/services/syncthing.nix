{ ... }:
let
  user = "robin";
in
{
  services.syncthing = {
    enable = true;
    user = user;
    dataDir = "/home/${user}/Documents/Obsidian";
    configDir = "/home/${user}/Documents/Obsidian/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "android" = { id = "PPFPPFR-KGPXPKP-HZP3K3Q-GM6FIG7-MG7UYNB-VSPDGYL-D4FCD2T-4TQPZQR"; };
      };
      folders = {
        "Obsidian" = {
          path = "/home/${user}/Documents/Obsidian";
          devices = [ "android" ];
        };
      };
    };
  };
}
