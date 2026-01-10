-- Mini.nvim
-- vim.pack.add({"https://github.com/nvim-mini/mini.nvim.git"})
require("mini.surround").setup({
	mappings = {
		add = "na", -- Add surrounding in Normal and Visual modes
		delete = "nd", -- Delete surrounding
		find = "nf", -- Find surrounding (to the right)
		find_left = "nF", -- Find surrounding (to the left)
		highlight = "nh", -- Highlight surrounding
		replace = "nr", -- Replace surrounding

		suffix_last = "", -- Suffix to search with "prev" method
		suffix_next = "", -- Suffix to search with "next" method
	},
})
-- require("mini.jump2d").setup({})
require("mini.splitjoin").setup({})

require("flash").setup({})
vim.api.nvim_set_hl(0, "FlashLabel", { bold = true })
