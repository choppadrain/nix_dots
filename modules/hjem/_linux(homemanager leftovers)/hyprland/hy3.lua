local hy3 = hl.plugin.hy3
hl.config({
	general = {
		layout = "hy3",
	},
	plugin = {
		hy3 = {
			node_collapse_policy = 2,
			tabs = {
				text_font = "SFMono Bold Nerd",
				render_text = true,

				from_top = true,
				height = 25,
				blur = false,
				padding = 0,
				border_width = 0,
				radius = 0,
				text_padding = 6,
				text_center = true,
				text_height = 10,
				opacity = 0.98,
			},
			autotile = {
				enable = false,
				ephemeral_groups = true,
				trigger_width = 0,
				trigger_height = 0,
				workspaces = "all",
			},
		},
	},
})
