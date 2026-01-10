-- Colorscheme
-- vim.pack.add({"https://github.com/rktjmp/lush.nvim.git"})
-- vim.pack.add({"https://github.com/zenbones-theme/zenbones.nvim.git"})
-- vim.pack.add({"https://github.com/folke/tokyonight.nvim.git"})
-- vim.pack.add({"https://github.com/scottmckendry/cyberdream.nvim.git"})
-- vim.pack.add({"https://github.com/mistweaverco/vhs-era-theme.nvim.git"})
require("cyberdream").setup({
	overrides = function(colors)
		return {
			["@keyword"] = { bold = true },
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

local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

require("lualine").setup({
	options = {
		theme = bubbles_theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_b = { "filename", "branch" },
		lualine_c = {
			"%=", --[[ add your center components here in place of this comment ]]
		},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
