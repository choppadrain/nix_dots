{ ... }: {
  flake.modules.homeManager.sway =
    let
      up = "k";
      mod = "Mod4 ";
      left = "h";
      down = "j";
      right = "l";
      term = "kitty";
      menu = "wofi --show drun";
    in
    {
wayland.windowManager.sway.config = {
          modifier = mod;
          terminal = "kitty";
          menu = menu;
          floating = {
            border = 4;
            modifier = "${mod}";
          };

      keybindings = {
        "${mod}+Return" = "exec ${term}";
        "${mod}+q" = "kill";
        "${mod}+d" = "exec ${menu}";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+e" =
          "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        "${mod}+${left}" = "focus left";
        "${mod}+${down}" = "focus down";
        "${mod}+${up}" = "focus up";
        "${mod}+${right}" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${right}" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+z" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+Shift+f" = "inhibit_fullscreen toggle";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";

        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        "${mod}+r" = "mode \"resize\"";

        "--locked XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -2%";
        "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +2%";
        "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";

        "--locked XF86AudioPlay" = "exec playerctl play-pause";
        "--locked XF86AudioNext" = "exec playerctl next";
        "--locked XF86AudioPrev" = "exec playerctl previous";

        "--locked XF86MonBrightnessUp" =
          "exec sh -c 'for d in 1 2 3; do ddcutil --display $d setvcp 10 + 10; done'";
        "--locked XF86MonBrightnessDown" =
          "exec sh -c 'for d in 1 2 3; do ddcutil --display $d setvcp 10 - 10; done'";

        "${mod}+s" = "exec grim -g \"$(slurp -d)\" - | wl-copy";

      };

      modes = {
        resize = {
          "${left}" = "resize shrink width 10 px or 10 ppt";
          "${down}" = "resize grow height 10 px or 10 ppt";
          "${up}" = "resize shrink height 10 px or 10 ppt";
          "${right}" = "resize grow width 10 px or 10 ppt";

          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";

          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
          "${mod}+r" = "mode \"default\"";
        };
      };
    };
};
}
