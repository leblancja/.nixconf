{pkgs, ...}: {
  home.packages = with pkgs; [
    #utils
    zip
    unzip
    p7zip
    eza
    bat
    mcfly
    fd
    ripgrep
    gcc
    gnumake
    cargo
    rebar3
    btop

    #dev
    vscode-fhs
    docker
    docker-compose
    aseprite
    bruno
    bruno-cli
    blender
    godot
    gimp-with-plugins
    blockbench
    krita

    #productivity
    obsidian
    calibre

    #games
    prismlauncher

    #etc
    vesktop
    reaper
    yabridge
    inkscape-with-extensions
  ];
}
