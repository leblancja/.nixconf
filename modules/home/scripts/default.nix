{
  pkgs,
  username,
  ...
}: {
  home.packages = [
    (import ./emopicker.nix {inherit pkgs;})
    (import ./rofi-launcher.nix {inherit pkgs;})
    (import ./web-search.nix {inherit pkgs;})
  ];
}
