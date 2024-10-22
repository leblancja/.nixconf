{config, pkgs, ... }:

{
    fonts.packages = with pkgs; [
  	noto-fonts
	(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" "Hack" "Terminus" ]; })
  ];

}
