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
    ghostty
    alacritty

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
    qutebrowser
  ];
}
