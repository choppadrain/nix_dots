---------------------
---- KEYBINDINGS ----
---------------------
local terminal = "kitty"
local menu = "wofi --show drun"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(
	mainMod .. " + SHIFT + E ",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------
---drainbinds---
----------------

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitten quick-access-terminal"))

hl.bind("SUPER + G", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
----------------
--zoom----------
----------------
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

------------
---submaps---
------------
hl.bind(mainMod .. "+ R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	hl.bind("l", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

---------------------
---- HY3 PLUGIN -----
---------------------
local hy3 = hl.plugin.hy3
hl.bind(mainMod .. " + H", hy3.move_focus("l"))
hl.bind(mainMod .. " + L", hy3.move_focus("r"))
hl.bind(mainMod .. " + K", hy3.move_focus("u"))
hl.bind(mainMod .. " + J", hy3.move_focus("d"))

--horizon shi
hl.bind(mainMod .. " + i", hy3.make_group("h"))
hl.bind(mainMod .. " + o", hy3.make_group("v"))
