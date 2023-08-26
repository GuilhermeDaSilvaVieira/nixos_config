{ ... }: {
  # Specify each program separately
  imports = [
    ./fish.nix
    ./dconf.nix
    ./gnupg.nix
    ./river.nix
    ./xwayland.nix
    ./nvim.nix
  ];
}
