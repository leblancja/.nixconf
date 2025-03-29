{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    librewolf = {
      enable = true;
    };

    chromium = {
      enable = true;
    };
  };
}
