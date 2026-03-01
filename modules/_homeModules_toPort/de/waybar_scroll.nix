{...}: {
  programs = {
    waybar = {
      enable = true;

      settings = {
        main = {
          layer = "bottom";
          position = "top";

          height = 20;
          margin = "px px 0px px";

          modules-left = ["hyprland/workspaces"];
          modules-center = ["clock"];
          modules-right = ["cpu" "memory" "pulseaudio" "hyprland/language" "tray" "custom/notifications"];

          "hyprland/workspaces" = {
            "disable-scroll" = true;
            "show-special" = false;
            "all-outputs" = true;
            "format" = "{icon}";
            "persistent-workspaces" = {
              "*" = 4;
            };
            "format-icons" = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "10" = "10";
            };
          };

          "clock" = {
            format = "{:%a %d %b %H:%M}";
            tooltip = false;
          };
          "custom/notifications" = {
            format = "{icon}{text}";
            tooltip = false;
            rotate = 0;
            format-icons = {
              notification = " <span foreground='red'><sup></sup></span>";
              none = " ";
              dnd-notification = " <span foreground='red'><sup></sup></span>";
              dnd-none = " ";
              inhibited-notification = " <span foreground='red'><sup></sup></span>";
              inhibited-none = " ";
              dnd-inhibited-notification = " <span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = " ";
            };
            return-type = "json";
            exec = "swaync-client -swb";
            on-click = "swaync-client -t -sw";
            escape = true;
          };
          "cpu" = {
            format = " {usage}%";
            interval = 2;
            tooltip = false;
          };

          "memory" = {
            format = "  {used:0.1f}G/{total:0.1f}G";
            tooltip = false;
            interval = 5;
          };

          "tray" = {
            spacing = 5;
          };

          "pulseaudio" = {
            "scroll-step" = 5;
            "format" = " {icon}{volume}%";
            "format-muted" = "󰖁 Muted";
            "format-icons" = {
              "default" = [" " " " "  "];
            };
            "on-click" = "pamixer -t";
            "tooltip" = false;
          };

          "hyprland/language" = {
            "format" = "  {} ";
            "format-en" = "en";
            "format-ru" = "ru";
            "format-ro" = "ro";
          };
        };
      };
      style = ''
        * {
         padding: 0.1rem;
         font-size: 15px;
                font-family: "SFMono Nerd Font Bold";
        }
               window#waybar {
                 background-color: rgba(0, 8, 17, 0.7);
        }


      '';
    };
  };
}
