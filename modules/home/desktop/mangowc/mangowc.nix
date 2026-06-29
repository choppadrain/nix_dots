{ inputs, self, ... }: {
  flake.modules.nixos.mangowc = { pkgs, ... }: {
    imports = [
      inputs.mangowm.nixosModules.mango
    ];

    home-manager.sharedModules = [
      self.modules.homeManager.mangowc
      inputs.mangowm.hmModules.mango
    ];

    # main file with all dependencies and other stuff
    programs.mango.enable = true;

    environment.systemPackages = with pkgs; [
      wl-clipboard
      wofi
      grim
      slurp
      awww
    ];
  };
  flake.modules.homeManager.mangowc = { pkgs, scheme, ... }: {
    home = {
      pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.apple-cursor;
        name = "macOS";
        size = 21;
      };

      wayland.windowManager.mango = {
        enable = true;
        settings =
          let
            mod = "SUPER";
            s = scheme;
          in
          {

            "exec-once" = [
              "waybar"
              "awww-daemon"
            ];

            monitorrule = "name:DP-2,width:1920,height:1080,refresh:143.98,x:0,y:1";

            blur = 0;
            border_radius = 2;
            focused_opacity = 1.00;
            animations = 0;

            #colors
            bordercolor = "${s.base00}ff";
            focuscolor = "${s.base02}ff";

            keymode = {
              common.bind =

                [
                  "${mod}, Return,spawn, kitty"
                  "${mod}, q, killclient"
                  "${mod}, d, spawn, wofi --show drun"

                ];

              default.bind = [
                "${mod},h, focusdir, left"
                "${mod},j, focusdir,down"
                "${mod},k, focusdir, up"
                "${mod},l,focusdir, right"

                "${mod},h,exchange_client, left"
                "${mod},j,exchange_client, down"
                "${mod},k,exchange_client, up"
                "${mod},l,exchange_client, right"
              ];

              resize.bind = [
                "l,resizewin,+0, -50"
                "j, resizewin, +0, +50"
                "k, resizewin, -50, +0"
                "l, resizewin, +50, + 0"
              ];

            };
          };
      };
    };
  };
}
