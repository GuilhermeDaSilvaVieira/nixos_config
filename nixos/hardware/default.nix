{ ... }:
{
  # Specify each hardware separately
  imports = [
    ./bluetooth.nix
    # ./nvidia.nix
    ./graphics.nix
    ./pulseaudio.nix
  ];

  hardware.enableAllFirmware = true;
}
