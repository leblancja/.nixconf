{ config, pkgs, ... }:

{
<<<<<<< HEAD
  #systemd-boot.enable = true;
=======
>>>>>>> 7d8dfe7 (simplified setup)
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    };
}
