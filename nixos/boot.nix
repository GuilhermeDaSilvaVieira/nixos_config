{ pkgs, ... }:
{
  boot = {
    kernel.sysctl = {
      "vm.swappiness" = 3;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelParams = [ "nvidia_drm.modeset=1" ];
    # kernelModules = [
    #   "nvidia"
    #   "nvidia_modeset"
    #   "nvidia_uvm"
    #   "nvidia_drm"
    # ];
    initrd = {
      luks.devices."luks-442ae00d-fe6f-4bd9-9b0e-1feff1fb2ffb".device = "/dev/disk/by-uuid/442ae00d-fe6f-4bd9-9b0e-1feff1fb2ffb";
      #   kernelModules = [
      #     "nvidia"
      #     "nvidia_modeset"
      #     "nvidia_uvm"
      #     "nvidia_drm"
      #   ];
    };
    # blacklistedKernelModules = [ "kms" ];
    loader = {
      systemd-boot.enable = true;
      timeout = 0;
    };
  };
}
