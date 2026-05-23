hl.monitor({
	output = "DP-1",
	mode = "2560x1440@120",
	position = "0x0",
	scale = 1,
})

hl.on("hyprland.start", function()
	hl.exec_cmd(
		"hyprpaper & waypaper --restore & wl-gammarelay-rs & qs & xhost +SI:localuser:root & ghostty"
	)
end)

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

hl.config({
	misc = {
		force_default_wallpaper = 1,
		disable_hyprland_logo = true,
	},

	input = {
		kb_layout = "us",
		follow_mouse = 2,
		sensitivity = 0,
	},
})

require("style")
require("binds")
require("rules")
