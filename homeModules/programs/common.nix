{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    #archives
    zip
    unzip
    p7zip

    #utils
    eza
    bat
    mcfly
    fd
    ripgrep
    gcc
    gnumake
    cargo
    rebar3
    kitty
    btop

    #dev

    docker
    docker-compose
    postman
    aseprite

    #IDE
    vscode-fhs

    #productivity
    obsidian
    calibre

    #games
    prismlauncher
    itch

    #etc
    vesktop
    reaper
    yabridge
  ];
}
