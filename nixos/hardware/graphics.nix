{ ... }:
{
  hardware.graphics = {
    enable = true;
    # extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };
}
