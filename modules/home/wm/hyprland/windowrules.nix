{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.extraLuaFiles."windowrules" = {
      autoLoad = true;
      content = ''
                hl.window_rule({
            -- Fix some dragging issues with XWayland
            name  = "fix-xwayland-drags",
            match = {
                class      = "^$",
                title      = "^$",
                xwayland   = true,
                float      = true,
                fullscreen = false,
                pin        = false,
            },

            no_focus = true,
        })           
      '';
    };
  };
}
