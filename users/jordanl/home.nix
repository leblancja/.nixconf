{username, ...}: {
  imports = [
    ../../modules/home/shell
    ../../modules/home/hyprland
    ../../modules/home/nixvim
    ../../modules/home/emoji.nix
    ../../modules/home/git.nix
    ../../modules/home/kitty.nix
    ../../modules/home/browsers.nix
    ../../modules/home/packages.nix
    ../../modules/home/swaync.nix
    ../../modules/home/qt.nix
  ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
  programs.git = {
    userName = "leblancja";
    userEmail = "leblancja@outlook.com";
  };
}
