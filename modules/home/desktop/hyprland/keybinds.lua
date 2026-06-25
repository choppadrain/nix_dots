---------------------
---- KEYBINDINGS ----
---------------------
local terminal = "kitty"
local menu = "wofi --show drun"

local hy3 = hl.plugin.hy3

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

hl.bind(
	mainMod .. " + SHIFT + E ",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	-- adapted this to work with hy3
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hy3.move_to_workspace(tostring(i), {
			follow = false,
			warp = true,
		})
	)
end

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hy3.move_to_workspace("special:magic", { follow = true }))

-- Move/resize windows with mainMod
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--quick term
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitten quick-access-terminal"))

--screenshot
hl.bind("SUPER + G", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

-------------
---submaps---
-------------
hl.bind(mainMod .. "+ R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

---------------------
---- HY3 PLUGIN -----
---------------------

hl.bind(mainMod .. " + Q", hy3.kill_active())

hl.bind(mainMod .. " + H", hy3.move_focus("l"))
hl.bind(mainMod .. " + L", hy3.move_focus("r"))
hl.bind(mainMod .. " + K", hy3.move_focus("u"))
hl.bind(mainMod .. " + J", hy3.move_focus("d"))

--horizon shi
hl.bind(mainMod .. " + U", hy3.make_group("h"))
hl.bind(mainMod .. " + I", hy3.make_group("v"))
hl.bind(mainMod .. " + V", hy3.make_group("tab"))

-- fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "+ F ", hl.dsp.window.fullscreen_state({ internal = 1, client = 1, action = "toggle" }))
hl.bind(mainMod .. "+ SHIFT + P", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" })) --for helium shi

--tabs
hl.bind(mainMod .. " + Tab", hy3.focus_tab({ direction = "r", wrap = true }))

hl.bind(mainMod .. " + SHIFT + Tab", hy3.focus_tab({ direction = "l", wrap = true }))
