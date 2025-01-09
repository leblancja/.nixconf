{ pkgs, nixvim, ... }: 
{
  imports = [
    ../../homeModules/core.nix
    ../../homeModules/shell
    ../../homeModules/programs
    ../../homeModules/gnome

  ];

  programs.git = {
		userName = "leblancja";
		userEmail = "leblancja@outlook.com";
	};
}
