{
  host,
  pkgs,
  ...
}: {
  programs.thunar = {
    enable = false;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
    ];
  };
  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
  ];
}
