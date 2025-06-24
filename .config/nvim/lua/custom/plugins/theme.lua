return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"scottmckendry/cyberdream.nvim",
	-- 'nyoom-engineering/oxocarbon.nvim',
	name = "cyberdream",
	lazy = false,
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("cyberdream").setup({
			overrides = function(colors)
				return {
					["@keyword"] = { bold = true },
					["@function"] = { fg = colors.blue, bold = true },
					["@string"] = { fg = "#82cfff" },
				}
			end,

			colors = {
				blue = "#ff7eb6",
				fg = "#08bdba",
				orange = "#33b1ff",
				purple = "#5eff6c",
			},
			-- Load the colorscheme here.
		})
		-- Like many other themes, this one has different styles, and you could load
		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		-- vim.opt.background = 'dark'
		vim.cmd.colorscheme("cyberdream")
	end,
}
