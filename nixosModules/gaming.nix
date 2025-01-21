{ pkgs, username, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    heroic
    wine-staging
    winetricks
    protontricks
    gamescope
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "/home/${username}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;

}
