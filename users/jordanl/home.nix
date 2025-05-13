{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home/core.nix
    ../../modules/home/shell
    ../../modules/home/hyprland
    ../../modules/home/nixvim
    ../../modules/home/emoji.nix
    ../../modules/home/git.nix
    ../../modules/home/kitty.nix
    ../../modules/home/browsers.nix
    ../../modules/home/packages.nix
  ];

  programs.git = {
    userName = "leblancja";
    userEmail = "leblancja@outlook.com";
  };
}
