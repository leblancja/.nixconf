{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../homeModules/core.nix
    ../../homeModules/shell
    ../../homeModules/programs
    ../../homeModules/gnome
    #../../homeModules/hyprland
    ../../homeModules/nixvim
  ];

  programs.git = {
    userName = "leblancja";
    userEmail = "leblancja@outlook.com";
  };
}
