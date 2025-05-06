{pkgs, ...}: {
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
    btop

    #dev

    docker
    docker-compose
    postman
    aseprite
    blender
    godot
    gimp-with-plugins
    blockbench
    krita

    #IDE
    vscode-fhs

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
