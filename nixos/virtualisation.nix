{ inputs, outputs, ... }: {
  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
  };
}
