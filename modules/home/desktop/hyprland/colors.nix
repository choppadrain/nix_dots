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
                                       active = "${scheme.base01}",
                                       active_text = "${scheme.base05}",
                                       active_border = "${scheme.base17}",

                              --        urgent = "",
                                      urgent_text = "${scheme.base05}",
                              --        urgent_border = "",

                                      inactive = "${scheme.base00}",
                                      inactive_text = "${scheme.base05}",
                                     inactive_border = "${scheme.base01}",
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
