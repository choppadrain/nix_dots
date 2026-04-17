{ pkgs, ... }:
{
  flake.homeModules.niri = {
    programs.niri.settings = {
      #for hellwal
      prefer-no-csd = true;

      spawn-at-startup = [
        { argv = [ "waybar" ]; }
        { argv = [ "awww-daemon" ]; }
        { argv = [ "swaynotificationcenter" ]; }
        { argv = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]; }

      ];

      cursor = {
        theme = "macos";
        size = 14;
        hide-when-typing = true;
      };

      input = {
        keyboard = {
          xkb = {
            layout = "us, ru";
            options = "win_space_toggle";
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
