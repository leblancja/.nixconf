{config, pkgs, ... }:

{
    fonts.packages = with pkgs; [
  	  noto-fonts
	    nerd-fonts.fira-code 
      nerd-fonts.droid-sans-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.hack
      nerd-fonts.terminess-ttf
    ];

}
