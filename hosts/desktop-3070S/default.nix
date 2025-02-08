# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  system.stateVersion = "24.05";

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.extraModulePackages = with config.boot.kernelPackages; [ bbswitch ];
  boot.kernelParams = [
    "nvidia-drm.fbdev=1" 
    "initcall_blacklist=simpledrm_platform_driver_init"
  ];

  imports =
    [ 
      ../../nixosModules/system.nix
      ../../nixosModules/gnome.nix
      ../../nixosModules/gaming.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix

    ];

  #bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    };

  zramSwap.enable = true;

  networking.hostName = "desktop-3070S"; # Define your hostname.
  
  networking.networkmanager.enable = true;
  

 
  fileSystems."/home/jordanl/Store" = {
      device = "/dev/disk/by-uuid/f0e41fd2-331a-4265-8938-b1f3bb4b4da8";
      fsType = "btrfs";
      options = [ "defaults" ];
  };

  fileSystems."/home/jordanl/Extra" = {
      device = "/dev/disk/by-uuid/b93b2fa6-4a76-4cd7-85f9-fd035d2f11a4";
      fsType = "ext4";
      options = [ "defaults" ];
  };

  programs.zsh.enable = true;

  #for Nvidia GPU
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  programs.nix-ld.enable = true;
  services.flatpak.enable = true;



}
