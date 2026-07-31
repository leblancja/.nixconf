{config, ...}: {
  imports = [
    ./zsh.nix
    ./common.nix
    ./starship.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}
