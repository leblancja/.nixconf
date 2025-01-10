{ pkgs, nixvim, ...}:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    
    colorschemes = {
      kanagawa = {
        enable = true;
        settings = {
          colors.theme = wave;
        };
      };
    };
  };
}
