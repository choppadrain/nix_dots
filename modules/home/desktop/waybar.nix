{ self, ... }:
{
  flake.modules.nixos.waybar = {
    home-manager.sharedModules = [
      self.modules.homeManager.waybar
    ];
  };
  flake.modules.homeManager.waybar =
    { ... }:
    {
      programs = {
        waybar = {
          enable = true;

          settings = {
            main = {
              layer = "top";
              position = "left";
              exclusive = true;
              width = 30;
              margin-top = 0;
              margin-bottom = 0;
              margin-left = 0;
              spacing = 15;

              modules-left = [ ];
              modules-center = [
                "niri/workspaces"
              ];

              modules-right = [
                "niri/language"
                "clock"
                "tray"
              ];

              "niri/workspaces" = {
                format = "{icon}";
                format-icons = {
                  active = "●";
                  default = "○";
                };
              };
              "niri/language" = {
                format = " \n{}";
                format-ru = "ru";
                format-en = "en";
              };

              clock = {
                format = "{:%H\n%M\n -\n%d\n%m}";
                tooltip-format = "<tt><small>{calendar}</small></tt>";
                calendar = {
                  mode = "month";
                  mode-mon-col = 3;
                  on-scroll = 1;
                  format = {
                    months = "<span color='#ffead3'><b>{}</b></span>";
                    days = "<span color='#ecc6d9'><b>{}</b></span>";
                    weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                    weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                    today = "<span color='#ff6699'><b><u>{}</u></b></span>";
                  };
                };
              };

              tray = {
                icon-size = 18;
                spacing = 10;
              };
            };
          };
          style = ''
            * {
             padding: 0.1rem;
             font-size: 15px;
                    font-family: "SFMono Nerd Font Bold";
                    color: white;
            }
                   window#waybar {
                     background-color: rgba(0, 8, 17, 1);
            }


          '';
        };
      };
    };
}
