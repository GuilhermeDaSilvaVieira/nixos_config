{ inputs, outputs, ... }: {
  # Specify each environment attribute separately
  imports = [
    ./variables.nix
    ./pkgs.nix
  ];
}
