hl.bind("CTRL + SHIFT + F", hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/apps.rasi"))
hl.bind(
	"CTRL + SHIFT + Up",
	hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -500")
)
hl.bind(
	"CTRL + SHIFT + Down",
	hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +500")
)
hl.bind("CTRL + SHIFT + A", hl.dsp.exec_cmd("ghostty"))
hl.bind("CTRL + SHIFT + F", hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/apps.rasi"))
hl.bind("CTRL + SHIFT + R", hl.dsp.exec_cmd("toggle_bar"))

hl.bind("ALT + period", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + comma", hl.dsp.focus({ direction = "down" }))

hl.bind("CTRL + SHIFT + E", hl.dsp.workspace.toggle_special())
hl.bind("CTRL + SHIFT + G", hl.dsp.window.move({ workspace = "special" }))
hl.bind("CTRL + SHIFT + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("CTRL + SHIFT + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("CTRL + SHIFT + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("CTRL + SHIFT + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("CTRL + SHIFT + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind("CTRL + SHIFT + TAB", hl.dsp.window.close())
hl.bind("ALT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("ALT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("ALT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("ALT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("ALT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind("ALT + mouse:272", hl.dsp.window.drag())
hl.bind("ALT + mouse:273", hl.dsp.window.kill())
