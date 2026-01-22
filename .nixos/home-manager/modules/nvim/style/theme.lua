-- Colorscheme
-- vim.pack.add({"https://github.com/scottmckendry/cyberdream.nvim.git"})
-- vim.pack.add({"https://github.com/norcalli/nvim-colorizer.lua.git"})
require("colorizer").setup()
require("cyberdream").setup({
	overrides = function(colors)
		return {
			["@keyword"] = { fg = colors.magenta, bold = true },
			["@function"] = { fg = colors.blue, bold = true },
			["@string"] = { fg = "#82cfff" },
		}
	end,

	colors = {
		blue = "#ffaed7",
		fg = "#08bdba",
		orange = "#33b1ff",
		purple = "#5eff6c",
	},
	-- Load the colorscheme here.
})
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme cyberdream]])
