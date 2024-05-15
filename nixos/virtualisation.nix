{ ... }:
{
  virtualisation = {
    waydroid = {
      enable = true;
    };
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
    };
  };
}
