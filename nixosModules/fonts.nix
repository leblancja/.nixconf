{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      material-icons
      nerd-fonts.jetbrains-mono
    ];
  };
}
