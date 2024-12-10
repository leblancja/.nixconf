# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  system.stateVersion = "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.extraModulePackages = with config.boot.kernelPackages; [ bbswitch ];
  boot.kernelParams = [
    "nvidia-drm.fbdev=1" 
    "initcall_blacklist=simpledrm_platform_driver_init"
  ];


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
   imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./boot.nix
      ../../nixosModules/core
      ../../nixosModules/services
    ];

  networking.hostName = "jl-nixos-desktop"; # Define your hostname.
  
  networking.networkmanager.enable = true;
  time.timeZone = "America/Moncton";

  i18n.defaultLocale = "en_CA.UTF-8";
 
  fileSystems."/home/jordanl/Store" = {
      device = "/dev/disk/by-uuid/f0e41fd2-331a-4265-8938-b1f3bb4b4da8";
      fsType = "btrfs";
      options = [ "defaults" ];
  };

<<<<<<< HEAD
=======
  fileSystems."/home/jordanl/Extra" = {
      device = "/dev/disk/by-uuid/b93b2fa6-4a76-4cd7-85f9-fd035d2f11a4";
      fsType = "ext4";
      options = [ "defaults" ];
  };

>>>>>>> 7d8dfe7 (simplified setup)
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jordanl = {
    isNormalUser = true;
    description = "Jordan LeBlanc";
    extraGroups = [ "networkmanager" "wheel" "libvirtd"];
    home = "/home/jordanl";
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
	  vim
    wget
	  git
	  curl
	  unzip
	  xsel
	  zsh
	  direnv
    protontricks
  ];

  virtualisation.libvirtd.enable=true;
  environment.variables.EDITOR = "vim";
  services.flatpak.enable = true;

}
