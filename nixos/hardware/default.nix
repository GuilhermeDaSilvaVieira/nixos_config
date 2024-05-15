{ ... }: {
  # Specify each hardware separately
  imports = [
    ./bluetooth.nix
    ./nvidia.nix
    ./opengl.nix
    ./pulseaudio.nix
  ];

  hardware.enableAllFirmware = true;
}
