{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.extraLuaFiles."hy3" = {
      autoLoad = true;
      content = ''
            ---------------------
---- HY3 PLUGIN -----
---------------------
local hy3 = hl.plugin.hy3

hl.bind(mainMod .. " + left",  hy3.move_focus("l"))
hl.bind(mainMod .. " + right", hy3.move_focus("r"))
hl.bind(mainMod .. " + up",    hy3.move_focus("u"))
hl.bind(mainMod .. " + down",  hy3.move_focus("d"))

hl.bind(mainMod .. " + H", hy3.move_focus("l"))
hl.bind(mainMod .. " + L", hy3.move_focus("r"))
hl.bind(mainMod .. " + K", hy3.move_focus("u"))
hl.bind(mainMod .. " + J", hy3.move_focus("d"))

hl.bind(mainMod .. " + SHIFT + left",  hy3.move_window("l"))
hl.bind(mainMod .. " + SHIFT + right", hy3.move_window("r"))
hl.bind(mainMod .. " + SHIFT + up",    hy3.move_window("u"))
hl.bind(mainMod .. " + SHIFT + down",  hy3.move_window("d"))

hl.bind(mainMod .. " + B", hy3.make_group("h"))  
hl.bind(mainMod .. " + M", hy3.make_group("v"))    
hl.bind(mainMod .. " + W", hy3.make_group("tab")) 
hl.bind(mainMod .. " + T", hy3.change_group("toggletab")) 

hl.bind(mainMod .. " + bracketleft",  hy3.focus_tab({ direction = "l", wrap = true }))
hl.bind(mainMod .. " + bracketright", hy3.focus_tab({ direction = "r", wrap = true })) 

hl.bind(mainMod .. " + F", hy3.expand("fullscreen", { fullscreen = "fullscreen_maximize" }))
hl.bind(mainMod .. " + Q", hy3.kill_active())
      '';
    };
  };
}
