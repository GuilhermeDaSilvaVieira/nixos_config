{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "br";
    excludePackages = with pkgs; [ xterm ];
    # videoDrivers = [ "nvidia" ];
    displayManager.startx.enable = true;
    windowManager.awesome.enable = true;
  };
  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;
}
