{ ... }: {
  # Specify each hardware separately
  imports = [
    ./nvidia.nix
    ./opengl.nix
    ./bluetooth.nix
    ./pulseaudio.nix
  ];

  hardware.enableAllFirmware = true;
  hardware.steam-hardware.enable = true;
}
