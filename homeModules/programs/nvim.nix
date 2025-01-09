{config, pkgs, nixvim, ...}:

{
  programs.neovim = {
    enable = true;
    extraConfig = nixvim.defaultConfig;
    pluigins = {
      enable = true;
    };
  };
}
