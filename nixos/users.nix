{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      luffy = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
      zoro.isNormalUser = true;
      nami.isNormalUser = true;
      usopp.isNormalUser = true;
      sanji.isNormalUser = true;
      chopper.isNormalUser = true;
      robin = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "syncthing"
        ];
      };
      franky = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "libvirtd"
        ];
      };
      brook.isNormalUser = true;
      jinbe.isNormalUser = true;
    };
  };
}
