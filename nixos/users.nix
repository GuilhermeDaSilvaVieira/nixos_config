{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      wado_ichimonji = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "libvirtd" "syncthing" ];
      };
      sandai_kitetsu = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
      };
      enma = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" ];
      };
    };
  };
}
