-- Nvim-ts-autotag
require("nvim-ts-autotag").setup({})

require("leetcode").setup({
  ---@type lc.lang
  lang = "python3",
})

-- Fidget.nvim
require("fidget").setup({})

-- Oil.nvim
require("oil").setup({
	keymaps = {
		["l"] = "actions.select",
		["h"] = "actions.parent",
		["<m-y>"] = "actions.yank_entry",
	},
})
vim.keymap.set("n", "<Esc>h", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Conform.nvim
-- vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" }
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		csharp = { "csharpier" },
		bash = { "shfmt" },
		typst = { "typstyle" },
    python = { "black" },
	},
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })

require("typst-preview").setup({ invert_colors = "always" })
vim.keymap.set("n", "<leader>p", "<cmd>TypstPreview<cr>", { desc = "Typst Preview Start" })

-- Mini.nvim
-- vim.pack.add({"https://github.com/nvim-mini/mini.nvim.git"})
require("mini.surround").setup({
	mappings = {
		add = "na", -- Add surrounding in Normal and Visual modes
		delete = "nd", -- Delete surrounding
		find = "nf", -- Find surrounding (to the right)
		find_left = "nf", -- Find surrounding (to the left)
		highlight = "nh", -- Highlight surrounding
		replace = "nr", -- Replace surrounding

		suffix_last = "", -- Suffix to search with "prev" method
		suffix_next = "", -- Suffix to search with "next" method
	},
})
require("mini.splitjoin").setup({})
require("mini.move").setup({})

-- Flash.nvim
-- vim.pack.add({ "https://github.com/folke/flash.nvim.git"})
require("flash").setup({
	vim.api.nvim_set_hl(0, "FlashLabel", { bold = true }),
})

vim.keymap.set({ "n", "v" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

-- Which-key.nvim
-- vim.pack.add({ "https://github.com/folke/which-key.nvim.git" })
require("which-key").setup({})

vim.pack.add({"https://github.com/jlcrochet/vim-razor.git"})
