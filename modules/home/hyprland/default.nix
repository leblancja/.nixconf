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
    ./animations-def.nix
    ../rofi
    ../scripts
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  home.file = {
    "Pictures/Wallpapers" = {
      source = ../../../wallpapers;
      recursive = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };

    xwayland = {
      enable = true;
    };

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

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2; # change to 1 if want to disable
        enable_hyprcursor = false;
        warp_on_change_workspace = 2;
        no_warps = true;
      };

      input = {
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        sensitivity = 0;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          #color = "rgba(1a1a1aee)";
        };
      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        #vfr = true; # Variable Frame Rate
        #vrr = 1; #Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
        # Screen flashing to black momentarily or going black when app is fullscreen
        # Try setting vrr to 0
      };

      exec-once = [
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "wl-paste --type image --watch cliphist store # Stores only image data"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        #"killall -q wbg;sleep .5 && wbg"
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

    # extraConfig = ''
    #   xwayland {
    #     force_zero_scaling = true
    #   }
    # '';
  };

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swappy
    ydotool
    swww
    hyprpolkitagent
    hyprland-qtutils
  ];
}
