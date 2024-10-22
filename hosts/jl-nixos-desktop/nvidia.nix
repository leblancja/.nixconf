{ config, pkgs, ... }:

{
<<<<<<< HEAD
  hardware.opengl.enable = true;
=======
>>>>>>> 7d8dfe7 (simplified setup)
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

}
