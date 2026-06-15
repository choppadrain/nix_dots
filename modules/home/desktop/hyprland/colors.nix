{ ... }: {
  flake.modules.homeManager.hyprland = { scheme, ... }: {
    wayland.windowManager.hyprland.extraLuaFiles."colors" = {
      autoLoad = true;
      content = ''

        hy3 = hl.plugin.hy3

                       hl.config({
                          plugin = {
                              hy3 = {
                                node_collapse_policy = 2,
                              tabs = {
                                  render_text = true,

                                  text_font = "Sans",
                                  from_top = true,
                                },
                              --    colors = {
                              --        active = "",
                              --        active_text = "",
                              --       active_border = "",

                              --        urgent = "",
                              --        urgent_text = "",
                              --        urgent_border = "",

                              --        inactive = "",
                              --        inactive_text = "",
                              --        inactive_border = "",
                              --    },
                              },
                          },
                            general = {
                                col = {
                                    active_border = "${scheme.base17}",
                                    inactive_border = "${scheme.base00}",
                        },
                    },
                })
      '';
    };
  };
}
