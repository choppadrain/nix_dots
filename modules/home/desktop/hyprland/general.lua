hl.monitor({
	output = "DP-2",
	mode = "1920x1080@143.98Hz",
	position = "auto",
	scale = "auto",
})

local terminal = "kitty"
local menu = "wofi --show drun"

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & awww-daemon ")
end)

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 7,

		border_size = 2,

		resize_on_border = false,

		allow_tearing = false,

		layout = "hy3",
	},

	decoration = {
		rounding = 0,
		rounding_power = 0,

		active_opacity = 1,
		inactive_opacity = 0.96,

		shadow = {
			enabled = false,
		},
		blur = {
			enabled = false,
		},
	},
	animations = {
		enabled = false,
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},

	input = {
		kb_layout = "us, ru",
		kb_variant = "",
		kb_options = "grp:win_space_toggle",

		follow_mouse = 1,
		accel_profile = "flat",

		sensitivity = 0,
	},

	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
})
--xdg
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
--qt
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

--toolkit
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
