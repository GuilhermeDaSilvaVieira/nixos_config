{ inputs, outputs, ... }: {
  hardware.nvidia = {
    powerManagement.enable = true;
    forceFullCompositionPipeline = true;
    nvidiaSettings = true;
    modesetting.enable = true;
  };
}
