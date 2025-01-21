{ pkgs, ... }:
{
  boot = {
    # kernel.sysctl = {
    #   "vm.swappiness" = 0;
    # };
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelParams = [ "nvidia_drm.modeset=1" ];
    # kernelModules = [
    #   "nvidia"
    #   "nvidia_modeset"
    #   "nvidia_uvm"
    #   "nvidia_drm"
    # ];
    initrd = {
      luks.devices."luks-a6e2b478-115e-4b80-acdc-589ad8fb529a".device =
        "/dev/disk/by-uuid/a6e2b478-115e-4b80-acdc-589ad8fb529a";
      #   kernelModules = [
      #     "nvidia"
      #     "nvidia_modeset"
      #     "nvidia_uvm"
      #     "nvidia_drm"
      #   ];
    };
    # blacklistedKernelModules = [
    #   "kms"
    #   "nvidiafb"
    # ];
    loader = {
      systemd-boot.enable = true;
      timeout = 0;
    };
  };
}
