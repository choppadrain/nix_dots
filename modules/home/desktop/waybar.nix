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
              layer = "bottom";
              position = "bottom";
              exclusive = true;
              width = 9;
              margin-top = 0;
              margin-bottom = 0;
              margin-left = 0;
              spacing = 0;
              modules-left = [ "hyprland/workspaces" ];
              modules-center = [ ];
              modules-right = [
                "custom/language"
                "cpu"
                "memory"
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

              "hyprland/workspaces" = {
                format = "{name}";
              };
              clock = {
                format = "{:%d.%m.%Y ::  %H:%M} ::";
                tooltip-format = "<tt><small>{calendar}</small></tt>";
              };

              "custom/language" = {
                exec = "hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | sed -e 's/English (US)/us/' -e 's/Russian/ru/'";
                interval = 1;
                format = "lang {} ::";
              };

              tray = {
                icon-size = 13;
                spacing = 0;
              };
            };
          };
          style = ''
                            #language {
                      min-width: 65px;
                      margin-right: 15px;
                    }

                    #cpu {
                      min-width: 55px;
                      margin-right: 15px;
                    }

                    #memory {
                      min-width: 55px;
                      margin-right: 15px;
                    }

            #workspaces {
                      min-width: 140px;
                    }

                    #clock {
                      min-width: 90px;
                      margin-right: 15px;
                    }
                        * {
                         padding: 0.1rem;
                         font-size: 12.5px;
                                font-family: "SFMono Nerd Font Bold";
                                color: ${scheme.base05};
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
            #workspaces button.active {
                      background-color: ${scheme.base02}; 
                      color: #ffffff;
                    }
                        #tray {
                            background-color: ${scheme.base00};
                            padding: 0 6px;
                    }
            #tray menu menuitem {
                      color: ${scheme.base00};
                      padding: 4px 8px;
                    }

                    #tray menu menuitem:hover {
                      background: ${scheme.base03};
                    }


          '';
        };
      };
    };
}
