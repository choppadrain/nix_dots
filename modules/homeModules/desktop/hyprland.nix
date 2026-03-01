{
  flake.homeModules.hyprland =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        bibata-cursors
      ];
      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
          monitor = "DP-2, 1920x1080@144, 0x0, 1";
          "env" = "HYPRCURSOR_THEME, Bibata-Modern-Ice";
          general = {
            gaps_in = "12";
            gaps_out = "15";
            border_size = "3";
            allow_tearing = true;
            layout = "dwindle";
            "col.active_border" = "rgba(88888888)";
            "col.inactive_border" = "rgba(00000088)";
          };

          decoration = {
            rounding = "4";

            active_opacity = "1.0";
            inactive_opacity = "0.9";

            shadow = {
              enabled = false;
              range = "15";
              render_power = "3";
              color = "rgba(00000088)";
            };

            blur = {
              enabled = true;
              size = "8";
              passes = "3";
              xray = true;
              vibrancy = "0.05";
            };
          };

          animations = {
            enabled = true;
          };

          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };
          misc = {
            force_default_wallpaper = "1";
            disable_hyprland_logo = true;
          };

          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];
          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];

          exec-once = [
            "systemctl --user start hyprpolkitagent"
            "swaynotificationcenter"
            "waybar"
            "hyprctl setcursor Bibata-Modern-Ice 24"
            "swww-daemon"
          ];

          "$mod" = "SUPER";
          bind = [
            # summoning apps
            "$mod, return, exec, kitty"
            "$mod, tab, exec, kitty -e yazi"
            "$mod, D, exec, wofi --show drun"

            # judging apps
            "$mod, Q, killactive,"
            "$mod, M, exit"
            "$mod, F, togglefloating"

            # dvindle
            "$mod, e, togglesplit"
            "$mod, p, pseudo"

            #move focus
            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"

            #switch workspaces
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"

            #move windows
            "$mod SHIFT, H, movewindow, l"
            "$mod SHIFT, J, movewindow, d"
            "$mod SHIFT, K, movewindow, u"
            "$mod SHIFT, L, movewindow, r"

            #special workspace

            "$mod, S, togglespecialworkspace, magic"
            "$mod SHIFT, S, movetoworkspace, special:magic"

            #moveactiveto
            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"

            #etc
            ", Print, exec, grim -g \"$(slurp -d)\" - | wl-copy"
          ];

          bindm = [
            # Move/resize windows with mainMod + LMB/RMB and dragging
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];

          bindl = [
            # Requires playerctl
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
          ];

          input = {
            kb_layout = "us, ru";
            kb_options = "grp:alt_shift_toggle";

            follow_mouse = "1";
            sensitivity = "0";
            accel_profile = "flat";
          };
          workspace = [
            "windowrulev2 = fullscreen, class:^(GT: New Horizons.*)$"

            "windowrulev2 = noanim, class:^(GT: New Horizons.*)$`"
            "windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
          ];
        };
      };
    };
}
