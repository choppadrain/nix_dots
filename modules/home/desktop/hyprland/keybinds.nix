{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.extraLuaFiles."keybinds" = {
      autoLoad = true;
      content = ''
                ---------------------
                ---- KEYBINDINGS ----
                ---------------------
                local terminal = "kitty"
                local menu = "wofi --show drun"

                local mainMod = "SUPER" -- Sets "Windows" key as main modifier

                -- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
                hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
                local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
                -- closeWindowBind:set_enabled(false)
                hl.bind(mainMod .. " + SHIFT + E ", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
                -- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
                hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
                hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
                --hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
                --hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only


                -- Move focus with mainMod + arrow keys
                hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
                hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
                hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
                hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


                hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
                hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
                hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
                hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

                -- Switch workspaces with mainMod + [0-9]
                -- Move active window to a workspace with mainMod + SHIFT + [0-9]
                for i = 1, 10 do
                    local key = i % 10 -- 10 maps to key 0
                    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
                    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
                end

                -- Example special workspace (scratchpad)
                hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
                hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

                -- Scroll through existing workspaces with mainMod + scroll
                hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
                hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

                -- Move/resize windows with mainMod + LMB/RMB and dragging
                hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
                hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

                -- Laptop multimedia keys for volume and LCD brightness
                hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
                hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
                hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
                hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
                hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
                hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

                -- Requires playerctl
                hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
                hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
                hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
                hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })       

                ----------------
                ---drainbinds---
                ----------------

                hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitten quick-access-terminal"))

                hl.bind("SUPER + G", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

                --zoom
        local MAX_ZOOM = 3
        local MIN_ZOOM = 1
        local ZOOM_TOGGLE_FACTOR = 1.5

        ---@param offset number
        ---@return nil
        local function zoom(offset)
            local current = hl.get_config("cursor.zoom_factor")
            if offset ~= nil then
                current = current + offset
            elseif current ~= MIN_ZOOM then
                current = MIN_ZOOM
            else
                current = ZOOM_TOGGLE_FACTOR
            end
            current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
            hl.config({ cursor = { zoom_factor = current } })
        end

        hl.bind("SUPER + Z", zoom)
        hl.bind("SUPER + KP_ADD", function()
            zoom(0.5)
        end)
        hl.bind("SUPER + minus", function()
            zoom(-0.5)
        end)

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
