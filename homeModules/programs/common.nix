{ lib, pkgs, ... }:

{
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
    go
    typescript
    jdk
    python3
    nodejs
    docker
    docker-compose
    postman

    #IDE
    vscode

    #productivity
    obsidian
    calibre


    #games
    prismlauncher
    itch
  ];

}
