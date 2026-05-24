hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 0,
		resize_on_border = true,
		allow_tearing = false,
		layout = "scrolling",
	},

	scrolling = {
		column_width = 0.95,
		direction = "down",
		focus_fit_method = 0,
	},

	cursor = {
		no_hardware_cursors = true,
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,
		active_opacity = 0.95,
		inactive_opacity = 0.6,

		blur = {
			enabled = true,
			size = 5,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	misc = {
		force_default_wallpaper = 1,
		disable_hyprland_logo = true,
	},
})

hl.curve("easeInOutCustom", { type = "bezier", points = { { 0.71, 0.21 }, { 0.35, 0.9 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInQuint", { type = "bezier", points = { { 0.64, 0 }, { 0.78, 0 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve( "rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 7 } )

hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.73, bezier = "easeInQuint" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "quick" })
-- hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.55, bezier = "easeOutCubic", style = "slide bottom" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.21, spring = "rubber", style = "slide bottom" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeInOutCustom", style = "slide" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 2.21, spring = "rubber", style = "slide bottom" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2.55, bezier = "almostLinear", style = "fade" })
