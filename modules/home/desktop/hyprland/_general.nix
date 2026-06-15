{ ... }: {
  flake.modules.homeManager.hyprland = { scheme, ... }: {
    wayland.windowManager.hyprland.extraLuaFiles."general" = {
      autoLoad = true;
      content = ''
                hl.config({
                  plugin = {
                      hy3 = {
                          render_text = true,
                          node_collapse_policy = 2,
                          text_font = "Sans",
                          from_top = true,

                          colors = {
                              active = "",
                              active_text = "",
                              active_border = "",

                              urgent = "",
                              urgent_text = "",
                              urgent_border = "",

                              inactive = "",
                              inactive_text = "",
                              inactive_border = "",
                          },
                      },
                  },
                    general = {
                        color = {
                active_border = "#c9b1ca",
                inactive_border = "#141415",
                },
            },
        })
      '';
    };
  };
}
