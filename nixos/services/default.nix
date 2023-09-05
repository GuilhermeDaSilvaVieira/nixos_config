{ ... }: {
  # Specify each service separately
  imports = [
    ./openssh.nix
    ./xserver.nix
    ./printing.nix
    ./avahi.nix
    ./greetd.nix
    ./pipewire.nix
    ./udisks2.nix
    ./devmon.nix
    ./picom.nix
    ./transmission.nix
    ./syncthing.nix
  ];
}
