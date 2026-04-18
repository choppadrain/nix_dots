{ ... }:
{
  flake.homeModules.niri =
    { config, ... }:
    {
      programs.niri.settings = {

        binds = with config.lib.niri.actions; {
          "Mod+Shift+Slash".action = show-hotkey-overlay;

          "Mod+Return".action = spawn "kitty";
          "Mod+D".action =
            spawn-sh "pgrep wofi >/dev/null 2>&1 && killall wofi || wofi --show drun --location=top -y 15";

          "Super+Alt+S".action = spawn-sh "pkill orca || exec orca";

          #"XF86AudioRaiseVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          #"XF86AudioLowerVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          #"XF86AudioMute".action        = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          #"XF86AudioMicMute".action     = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          #"XF86MonBrightnessUp".action   = spawn "brightnessctl" "--class=backlight" "set" "+10%";
          #"XF86MonBrightnessDown".action = spawn "brightnessctl" "--class=backlight" "set" "10%-";

          "Mod+O".action = toggle-overview;
          "Mod+Q".action = close-window;

          "Mod+H".action = focus-column-left;
          "Mod+J".action = focus-window-down;
          "Mod+K".action = focus-window-up;
          "Mod+L".action = focus-column-right;

          # "Mod+Ctrl+Left".action  = move-column-left;
          # "Mod+Ctrl+Down".action  = move-window-down;
          # "Mod+Ctrl+Up".action    = move-window-up;
          # "Mod+Ctrl+Right".action = move-column-right;

          "Mod+Ctrl+H".action = move-column-left;
          "Mod+Ctrl+J".action = move-window-down;
          "Mod+Ctrl+K".action = move-window-up;
          "Mod+Ctrl+L".action = move-column-right;

          "Mod+Home".action = focus-column-first;
          "Mod+End".action = focus-column-last;

          "Mod+Ctrl+Home".action = move-column-to-first;
          "Mod+Ctrl+End".action = move-column-to-last;

          "Mod+Page_Down".action = focus-workspace-down;
          "Mod+Page_Up".action = focus-workspace-up;
          "Mod+U".action = focus-workspace-down;
          "Mod+I".action = focus-workspace-up;

          "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
          "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
          "Mod+Shift+J".action = move-column-to-workspace-down;
          "Mod+Shift+K".action = move-column-to-workspace-up;

          "Mod+Shift+Page_Down".action = move-workspace-down;
          "Mod+Shift+Page_Up".action = move-workspace-up;
          "Mod+Shift+U".action = move-workspace-down;
          "Mod+Shift+I".action = move-workspace-up;

          "Mod+WheelScrollDown".action = focus-workspace-down;
          "Mod+WheelScrollUp".action = focus-workspace-up;
          "Mod+Ctrl+WheelScrollDown".action = move-column-to-workspace-down;
          "Mod+Ctrl+WheelScrollUp".action = move-column-to-workspace-up;

          "Mod+WheelScrollRight".action = focus-column-right;
          "Mod+WheelScrollLeft".action = focus-column-left;
          "Mod+Ctrl+WheelScrollRight".action = move-column-right;
          "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

          "Mod+Shift+WheelScrollDown".action = focus-column-right;
          "Mod+Shift+WheelScrollUp".action = focus-column-left;
          "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
          "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;

          "Mod+Shift+1".action = move-column-to-index 1;
          "Mod+Shift+2".action = move-column-to-index 2;
          "Mod+Shift+3".action = move-column-to-index 3;
          "Mod+Shift+4".action = move-column-to-index 4;
          "Mod+Shift+5".action = move-column-to-index 5;
          "Mod+Shift+6".action = move-column-to-index 6;
          "Mod+Shift+7".action = move-column-to-index 7;
          "Mod+Shift+8".action = move-column-to-index 8;
          "Mod+Shift+9".action = move-column-to-index 9;

          "Mod+BracketLeft".action = consume-or-expel-window-left;
          "Mod+BracketRight".action = consume-or-expel-window-right;

          #"Mod+Comma".action  = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          "Mod+R".action = switch-preset-column-width;
          "Mod+Shift+R".action = switch-preset-window-height;
          "Mod+Ctrl+R".action = reset-window-height;

          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;

          "Mod+Ctrl+F".action = expand-column-to-available-width;

          "Mod+T".action = center-column;
          "Mod+Ctrl+T".action = center-visible-columns;

          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Equal".action = set-column-width "+10%";

          "Mod+Shift+Minus".action = set-window-height "-10%";
          "Mod+Shift+Equal".action = set-window-height "+10%";

          "Mod+G".action = toggle-window-floating;
          "Mod+Shift+G".action = switch-focus-between-floating-and-tiling;

          "Mod+W".action = toggle-column-tabbed-display;

          #"Print".action      = screenshot;
          #"Ctrl+Print".action = screenshot-screen;
          #"Alt+Print".action  = screenshot-window;

          "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit;

          "Mod+Shift+E".action = quit;
          "Ctrl+Alt+Delete".action = quit;

          "Mod+Shift+P".action = power-off-monitors;
        };
      };
    };
}
