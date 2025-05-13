{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kanagawa-gtk-theme
    #kanagawa-icon-theme
    # gtk-engine-murrine
    # gnome-themes-extra
    # gnome-tweaks
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-BL";
      package = pkgs.kanagawa-gtk-theme;
    };
    # iconTheme = {
    #   name = "Kanagawa";
    #   package = pkgs.kanagawa-icon-theme;
    # };
  };
}
