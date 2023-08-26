{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "nvidia_drm.modeset=1" ];
    kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    initrd.kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    blacklistedKernelModules = [ "kms" ];
    loader = {
      systemd-boot.enable = true;
      timeout = 0;
    };
  };
}
