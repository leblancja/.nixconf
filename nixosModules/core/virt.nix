{ config, pkgs }:

{
    virtualization.libvirtd.enable = true;
    virtualization.libvirtd.qemuPackage = pkgs.qemu_kvm;
    virtualization.qemu.allowedBridges = [ "virbr0" ];
    hardware.cpu.amd.updateMicrocide = true;
}