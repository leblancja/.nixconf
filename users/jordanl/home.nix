{
  pkgs,
  nixvim,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker"];
    home = "/home/${username}";
    shell = pkgs.zsh;
  };
  imports = [
    ../../homeModules/core.nix
    ../../homeModules/shell
    ../../homeModules/programs
    ../../homeModules/gnome
    #../../homeModules/hyprland
    ../../homeModules/nixvim
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
  };
  programs.git = {
    userName = "leblancja";
    userEmail = "leblancja@outlook.com";
  };
}
