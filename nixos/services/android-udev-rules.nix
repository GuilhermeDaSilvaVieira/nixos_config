{ pkgs, ... }:
{
  # Flutter Android
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
