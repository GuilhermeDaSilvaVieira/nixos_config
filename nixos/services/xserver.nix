{ inputs, outputs, pkgs, ... }: {
  services.xserver = {
    enable = true;
    layout = "br";
    excludePackages = with pkgs; [ xterm ];
    videoDrivers = [ "nvidia" ];
    displayManager.startx.enable = true;
    windowManager.awesome.enable = true;
  };
}
