{ ... }:
{
  flake.homeModules.niri =
    { pkgs, ... }:
    {
      home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.apple-cursor;
        name = "macOS";
        size = 21;
      };
      programs.niri.settings = {
        prefer-no-csd = true;

        screenshot-path = "null";

        spawn-at-startup = [
          { argv = [ "waybar" ]; }
          { argv = [ "awww-daemon" ]; }
          { argv = [ "swaynotificationcenter" ]; }
          # { argv = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]; }
          { argv = [ "niri-scratchpad" ]; }
          {
            command = [
              "wl-clip-persist"
              "--clipboard"
              "both"
            ];
          }
          {
            command = [
              "sh"
              "-c"
              "wl-paste --type text --watch cliphist store"
            ];
          }
          {
            command = [
              "sh"
              "-c"
              "wl-paste --type image --watch cliphist store"
            ];
          }
        ];

        cursor = {
          theme = "macOS";
          size = 25;
          hide-when-typing = true;
        };

        input = {
          keyboard = {
            xkb = {
              layout = "us,ru";
              options = "grp:win_space_toggle";
            };
          };
          mouse = {
            accel-profile = "flat";
          };
        };

        environment = {
          QT_QPA_PLATFORM = "wayland";
          XDG_CURRENT_DESKTOP = "niri";
          ELECTRON_OZONE_PLATFORM_HINT = "auto";
          QT_QPA_PLATFORMTHEME = "gtk3";
          QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
        };
      };
    };
}
