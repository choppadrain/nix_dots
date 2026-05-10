{ self, ... }:
{
  flake.nixosModules.waybar = {
    home-manager.sharedModules = [
      self.homeModules.waybar
    ];
  };
  flake.homeModules.waybar = {config,...}:
  let
    scheme = config.scheme.withHastag;
  in

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
        spacing = 0;

        modules-left = [];
        modules-center = [ "niri/workspaces" ];
        modules-right = [ "clock" "tray" ];

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "●";
            default = "○";
          };
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
        style =  ''
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
