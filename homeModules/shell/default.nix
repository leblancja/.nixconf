{config, ...}: {
  imports = [
    ./zsh.nix
    ./common.nix
    ./starship.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "librewolf";
    TERMINAL = "kitty";
  };
}
