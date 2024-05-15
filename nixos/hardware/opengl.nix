{ pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };
}
