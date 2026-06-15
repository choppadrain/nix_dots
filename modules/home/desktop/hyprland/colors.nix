{ ... }: {
  flake.modules.homeManager.hyprland = { scheme, ... }: {
    wayland.windowManager.hyprland.extraLuaFiles."colors" = {
      autoLoad = true;
      content = ''

        hy3 = hl.plugin.hy3
                       hl.config({
                          plugin = {
                              hy3 = {
                                tabs = {
                                  colors = {
                                       active = "${scheme.base17}",
                                       active_text = "${scheme.base05}",
                                       active_border = "${scheme.base09}",

                              --        urgent = "",
                                      urgent_text = "${scheme.base05}",
                              --        urgent_border = "",

                              --        inactive = "",
                              --        inactive_text = "${scheme.base05}",
                              --        inactive_border = "",
                                  },

                                },
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
