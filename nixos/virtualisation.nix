{ ... }: {
  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
  };
}
