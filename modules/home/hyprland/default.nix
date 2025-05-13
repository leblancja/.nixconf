{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./waybar.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./pyprland.nix
    ../rofi
    ../scripts
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland = {
      enable = true;
    };

    systemd.enable = false;

    settings = {
      general = {
        "$modifier" = "SUPER";
        layout = "dwindle";
        gaps_in = 4;
        gaps_out = 6;
        resize_on_border = true;
      };

      monitor = [
        "DP-1, highres@165, auto, 1"
        "HDMI-A-1, preferred, auto-left, 1"
        "DP-2, preferred, auto-right, 1, transform, 1"
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      bind = [
        "$modifier,Return,exec,kitty"
        "$modifier,K,exec,list-keybinds"
        "$modifier SHIFT,Return,exec,rofi-launcher"
        "$modifier,T,exec,pypr toggle term"
        "$modifier SHIFT,I,togglesplit"
        "$modifier,F,fullscreen"
        "$modifier,Q,killactive"
        "$modifier SHIFT,F,togglefloating"
        "$modifier,B,exec,librewolf"
        "$modifier,M,exec,pavucontrol"
        "$modifier,Y,exec,kitty -e ranger"
        "$modifier,E,exec,emopicker"
        "$modifier SHIFT,C,exit,"
        "$modifier SHIFT,left,movewindow,l"
        "$modifier SHIFT,right,movewindow,r"
        "$modifier SHIFT,up,movewindow,u"
        "$modifier SHIFT,down,movewindow,d"
        "$modifier SHIFT,h,movewindow,l"
        "$modifier SHIFT,l,movewindow,r"
        "$modifier SHIFT,k,movewindow,u"
        "$modifier SHIFT,j,movewindow,d"
        "$modifier ALT, left, swapwindow,l"
        "$modifier ALT, right, swapwindow,r"
        "$modifier ALT, up, swapwindow,u"
        "$modifier ALT, down, swapwindow,d"
        "$modifier ALT, 43, swapwindow,l"
        "$modifier ALT, 46, swapwindow,r"
        "$modifier ALT, 45, swapwindow,u"
        "$modifier ALT, 44, swapwindow,d"
        "$modifier,left,movefocus,l"
        "$modifier,right,movefocus,r"
        "$modifier,up,movefocus,u"
        "$modifier,down,movefocus,d"
        "$modifier,h,movefocus,l"
        "$modifier,l,movefocus,r"
        "$modifier,k,movefocus,u"
        "$modifier,j,movefocus,d"
        "$modifier,1,workspace,1"
        "$modifier,2,workspace,2"
        "$modifier,3,workspace,3"
        "$modifier,4,workspace,4"
        "$modifier,5,workspace,5"
        "$modifier,6,workspace,6"
        "$modifier,7,workspace,7"
        "$modifier,8,workspace,8"
        "$modifier,9,workspace,9"
        "$modifier,0,workspace,10"
        "$modifier SHIFT,SPACE,movetoworkspace,special"
        "$modifier,SPACE,togglespecialworkspace"
        "$modifier SHIFT,1,movetoworkspace,1"
        "$modifier SHIFT,2,movetoworkspace,2"
        "$modifier SHIFT,3,movetoworkspace,3"
        "$modifier SHIFT,4,movetoworkspace,4"
        "$modifier SHIFT,5,movetoworkspace,5"
        "$modifier SHIFT,6,movetoworkspace,6"
        "$modifier SHIFT,7,movetoworkspace,7"
        "$modifier SHIFT,8,movetoworkspace,8"
        "$modifier SHIFT,9,movetoworkspace,9"
        "$modifier SHIFT,0,movetoworkspace,10"
        "$modifier CONTROL,right,workspace,e+1"
        "$modifier CONTROL,left,workspace,e-1"
        "$modifier,mouse_down,workspace, e+1"
        "$modifier,mouse_up,workspace, e-1"
        "ALT,Tab,cyclenext"
        "ALT,Tab,bringactivetotop"
      ];

      bindm = [
        "$modifier, mouse:272, movewindow"
        "$modifier, mouse:273, resizewindow"
      ];
      exec-once = [
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "wl-paste --type image --watch cliphist store # Stores only image data"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        # "killall -q swww;sleep .5 && swww init"
        "killall -q waybar;sleep .5 && waybar"
        # "killall -q swaync;sleep .5 && swaync"
        # "nm-applet --indicator"
        "pypr &"
        # "sleep 1.5 && swww img ${stylixImage}"
      ];

      # render = {
      #   explicit_sync = 1;
      #   explicit_sync_kms = 1;
      #   direct_scanout = 0;
      # };
      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, x11"
        "MOZ_ENABLE_WAYLAND, 1"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
      ];
    };

    extraConfig = ''
      xwayland {
        force_zero_scaling = true
      }
    '';
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.kanagawa-gtk-theme;
      name = "Kanagawa-BL";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Papirus-Dark";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swappy
    mpv
    pavucontrol
    nwg-displays
    picard
    yazi
    usbutils
    cliphist
    brightnessctl
    appimage-run
    duf
    glxinfo
    hyprpicker
    eog
    inxi
    killall
    libnotify
    lm_sensors
    lshw
    ncdu
    pciutils
    ydotool
  ];
}
