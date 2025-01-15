{ ... }:
{
  # Specify each hardware separately
  imports = [
    ./bluetooth.nix
    # ./nvidia.nix
    ./graphics.nix
  ];

  hardware.enableAllFirmware = true;
}
