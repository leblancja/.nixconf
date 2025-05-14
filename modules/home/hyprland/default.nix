{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./bindings.nix
    ./waybar.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./pyprland.nix
    ../rofi
    ../scripts
  ];

  home.file = {
    "Pictures/Wallpapers" = {
      source = ../../../wallpapers;
      recursive = true;
    };
  };

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

      exec-once = [
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "wl-paste --type image --watch cliphist store # Stores only image data"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        "killall -q swww;sleep .5 && swww init"
        "killall -q waybar;sleep .5 && waybar"
        "killall -q swaync;sleep .5 && swaync"
        "nm-applet --indicator"
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
    swww
  ];
}
