{ config, pkgs, lib, ... }:

{
    environment.systemPackages = with pkgs; [
        dotnet-sdk_9
        dotnet-runtime_9
        dotnet-aspnetcore_9
        ];

    environment.sessionVariables = {
        DOTNET_ROOT = "${pkgs.dotnet-sdk_9}";
        DOTNET_SKIP_FIRST_TIME_EXPERIENCE = "true";
    
    };

    environment.variables.PATH = lib.mkForce "${pkgs.dotnet-sdk_9}/bin:${pkgs.dotnet-runtime_9}/bin:${pkgs.dotnet-aspnetcore_9}/bin";
}