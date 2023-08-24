{ inputs, outputs, ... }: {
  # Specify each hardware separately
  imports = [
    ./nvidia.nix
    ./opengl.nix
    ./bluetooth.nix
    ./pulseaudio.nix
  ];
}
