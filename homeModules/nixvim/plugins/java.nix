{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      java.enable = true;
    };
  };
}
