{ self, ... }:
{
  flake.modules.nixos.desktop = {

    home-manager.sharedModules = [
      self.modules.homeManager.waybar
    ];
  };
  flake.modules.homeManager.waybar =
    { scheme, ... }:
    {
      programs = {
        waybar = {
          enable = true;

          settings = {
            main = {
              layer = "top";
              position = "bottom";
              exclusive = true;
              width = 9;
              margin-top = 0;
              margin-bottom = 0;
              margin-left = 0;
              spacing = 30;
              modules-left = [ "hyprland/workspaces" ];
              modules-center = [ ];
              modules-right = [
                "cpu" 
                "memory"
                "network"
                "clock"
                "tray"
              ];

              cpu = {
                format = "cpu {usage}% ::";
                interval = 2;
              };

              memory = {
                format = "ram {percentage}% ::";
                interval = 2;
              };

              network = {
                format-wifi = "{bandwidthDownBytes} :: ";
                format-ethernet = "network{bandwidthDownBytes}:: ";
                format-disconnected = "0";
                interval = 2;
              };

              "hyprland/workspaces" = {
                format = "{icon}";
                format-icons = {
                  active = "!";
                  default = "-";
                };
              };

              "hyprland/language" = {
                format = " {} ::";
                format-ru = "RU";
                format-en = "US";
              };

              clock = {
                format = "{date :%d.%m.%Y} ::";
                tooltip-format = "<tt><small>{calendar}</small></tt>";
              };

              tray = {
                icon-size = 13;
                spacing = 0;
              };
            };
          };
          style = ''
            * {
             padding: 0.1rem;
             font-size: 11.5px;
                    font-family: "SFMono Nerd Font Bold";
                    color: white;
            }
                   window#waybar {
                     background-color: ${scheme.base00};
            }
                    #workspaces button {
                        min-height: 0; 
                        min-width: 0;  
                        padding: 0 8px; 
                       color: #a6adc8;
                        background: transparent;
                        border: none;
                        border-radius: 0;
                        box-shadow: none;
                        text-shadow: none;
                    }


          '';
        };
      };
    };
}
