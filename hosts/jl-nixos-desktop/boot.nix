{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    };

  boot = {
    kernelModules = ["kvm-amd" "kvm-intel" "vfio-pci"];

  };
}
