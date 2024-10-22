{ pkgs, ... }:

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
<<<<<<< HEAD
=======
    heroic
    wine-staging
>>>>>>> 7d8dfe7 (simplified setup)
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "/home/jordanl/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;

<<<<<<< HEAD
  programs.heroic.enable;
=======
>>>>>>> 7d8dfe7 (simplified setup)

}
