{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./fonts.nix
    ./gaming.nix
    ./virt.nix
    ./dotnet.nix
  ]; 

}
