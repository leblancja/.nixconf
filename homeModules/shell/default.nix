{ config, ... }:

{
  imports = [
    ./zsh.nix
    ./common.nix
    ./starship.nix
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}