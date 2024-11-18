{ ... }:
{
  # Specify each program separately
  imports = [
    ./dconf.nix
    ./fish.nix
    ./gnupg.nix
    ./nano.nix
    ./river.nix
    ./xwayland.nix
    ./nix-ld.nix
    ./localsend.nix
  ];
}
