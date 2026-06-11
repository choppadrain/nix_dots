{ self, ... }: {
  flake.modules.nixos.desktop = {
    home-manager.sharedModules = [
      self.modules.homeManager.sway
    ];
  };
  flake.modules.homeManager.sway =
    {
      pkgs,
      scheme,
      ...
    }:
    let
      swayPatched = pkgs.sway-unwrapped.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          (pkgs.fetchpatch {
            url = "https://gist.githubusercontent.com/bim9262/0f63e6b5d8107d7d2654b61e0b7debe2/raw";
            hash = "sha256-+6II1Xnth/uenTeCnOUSDgsjpRgfW3ilRp+nMjs1eJg";
          })
        ];
      });

    in
    {
        home.packages = with pkgs; [
            grim
            slurp
            apple-cursor
            wl-clipboard
            mako
            polkit_gnome
            awww
            wofi
        ];
      wayland.windowManager.sway = {

        package = swayPatched;
        enable = true;
        systemd.enable = true;
        wrapperFeatures.gtk = true;
        config = {
          bars = [ ];

          output = {
            "DP-2" = {
              mode = "1920x1080@143.981Hz";
              position = "1920 0";
              transform = "normal";
            };
          };

         input = {
            "type:keyboard" = {
              xkb_layout = "us,ru";
             xkb_options = "grp:win_space_toggle";
            };
            "type:pointer" = {
              accel_profile = "flat";
              pointer_accel = "0.0";
            };
          };
          colors = {
            focused = {
              border = "${scheme.base08}";
              background = "${scheme.base08}";
              text = "${scheme.base05}";
              indicator = "${scheme.base0D}";
              childBorder = "${scheme.base08}";
            };

            focusedInactive = {
              border = "${scheme.base01}";
              background = "${scheme.base01}";
              text = "${scheme.base05}";
              indicator = "${scheme.base03}";
              childBorder = "${scheme.base01}";
            };

            unfocused = {
              border = "${scheme.base00}";
              background = "${scheme.base00}";
              text = "${scheme.base04}";
              indicator = "${scheme.base01}";
              childBorder = "${scheme.base00}";
            };

            urgent = {
              border = "${scheme.base08}";
              background = "${scheme.base08}";
              text = "${scheme.base05}";
              indicator = "${scheme.base08}";
              childBorder = "${scheme.base08}";
            };

          };
          gaps = {
            outer = 8;
          };

          window = {
            border = 4;
            commands = [
              {
                criteria = {
                  app_id = "^.*";
                };
                command = "border pixel 4";
              }
              {
                criteria = {
                  class = "^.*";
                };
                command = "border pixel 4";
              }
            ];
          };

          startup = [
            { command = "waybar"; }
            { command = "awww-daemon"; }
          ];

        };
      };
    };
}
