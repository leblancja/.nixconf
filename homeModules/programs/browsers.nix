{ pkgs, config, username, ... }:

{
  programs = {
    firefox = {
      enable = true;

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        
        DisablePocket = true;
        DontCheckDefaultBrowser = true;

      };
    };
  };
}