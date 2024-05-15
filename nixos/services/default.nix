{ ... }:
{
  # Specify each service separately
  imports = [
    ./avahi.nix
    ./devmon.nix
    ./greetd.nix
    ./openssh.nix
    ./picom.nix
    ./pipewire.nix
    ./printing.nix
    ./syncthing.nix
    ./transmission.nix
    ./udisks2.nix
    ./xserver.nix
    ./searxng.nix
  ];
}
