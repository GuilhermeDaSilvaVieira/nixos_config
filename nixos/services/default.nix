{ ... }:
{
  # Specify each service separately
  imports = [
    ./avahi.nix
    ./devmon.nix
    ./openssh.nix
    ./picom.nix
    ./pipewire.nix
    ./printing.nix
    ./syncthing.nix
    ./udisks2.nix
    ./xserver.nix
    ./searxng.nix
    ./logind.nix
    ./android-udev-rules.nix
    ./postgres.nix
    ./dbus.nix
    ./pulseaudio.nix
  ];
}
