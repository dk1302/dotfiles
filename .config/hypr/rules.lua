hl.window_rule({
	match = { class = "youtube-music-desktop-app" },
	float = true,
	size = { 1000, 720 },
	move = { 300, 100 },
})
hl.window_rule({ match = { class = "waypaper" }, float = true, size = { 800, 500 }, move = { 880, 160 } })
hl.window_rule({
	match = { class = ".blueman-manager-wrapped" },
	float = true,
	size = { 400, 500 },
	move = { 1950, 220 },
})
hl.window_rule({ match = { initial_title = "Ghostty" }, workspace = "2" })
hl.window_rule({ match = { class = "io.mgba.mGBA" }, float = true, center = true, size = { 700, 500 } })
hl.window_rule({ match = { title = "Polychromatic" }, float = true, center = true, size = { 700, 700 } })
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true, center = true, size = { 700, 500 } })
hl.window_rule({
	match = { title = "Steam", class = "steam" },
	move = { 600, 300 },
	float = true,
	size = { 1280, 720 },
})
hl.window_rule({ match = { title = "Steam Settings" }, float = true, center = true, size = { 1280, 720 } })
hl.window_rule({ match = { class = "steam" }, float = true })
hl.window_rule({ match = { title = ".*File.*" }, float = true, center = true, size = { 700, 500 } })
hl.window_rule({ match = { title = ".*Save.*" }, float = true, center = true, size = { 700, 500 } })
hl.window_rule({
	match = { initial_class = "firefox" },
	move = { 200, 50 },
	float = true,
	size = { 2000, 1380 },
})
hl.window_rule({ match = { title = "quickshell" }, float = true, size = { 420, 140 }, move = { 2115, 65 } })
