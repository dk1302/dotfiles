-- Conform.nvim
-- vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" }
require("auto-session").setup({
  enabled = false,
})
-- select a session to load
vim.keymap.set("n", "<leader>e", "<cmd>AutoSession search<cr>", { desc = "Search Sessions" })
-- load the last session
vim.keymap.set("n", "<leader>lr", "<cmd>AutoSession save<cr>", { desc = "Save Session" })

vim.keymap.set("n", "<leader>ln", function()
  local session = vim.fn.input("Session: ")
  vim.cmd("AutoSession save " .. session)
end, { desc = "Create New Session" })

vim.keymap.set("n", "<leader>lq", "<cmd>AutoSession deletePicker<cr>", { desc = "Delete Session" })

require("fidget").setup({})
require("oil").setup({
	keymaps = {
		["l"] = "actions.select",
		["h"] = "actions.parent",
		["<m-y>"] = "actions.yank_entry",
		["<space>"] = "actions.open_terminal",
	},
})
vim.keymap.set("n", "<Esc>h", "<CMD>Oil<CR>", { desc = "Open parent directory" })
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		csharp = { "csharpier" },
		typescript = { "prettier" },
		javascript = { "prettier" },
		python = { "black" },
		bash = { "shfmt" },
		typst = { "typstyle" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("typst-preview").setup({ invert_colors = "always" })
vim.keymap.set("n", "<leader>p", "<cmd>TypstPreview<cr>", { desc = "Typst Preview Start" })

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
require("mini.jump2d").setup({})
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

-- --Yazi.nvim
-- -- vim.pack.add({ "https://github.com/mikavilpas/yazi.nvim.git" })
-- vim.keymap.set("n", "<leader>r", function()
-- 	require("yazi").yazi()
-- end, { desc = "Yazi" })
--
-- vim.g.loaded_netrwPlugin = 1
-- vim.api.nvim_create_autocmd("UIEnter", {
-- 	callback = function()
-- 		require("yazi").setup({
-- 			open_for_directories = true,
-- 		})
-- 	end,
-- })

-- Which-key.nvim
-- vim.pack.add({ "https://github.com/folke/which-key.nvim.git" })
require("which-key").setup({})

-- Suda.vim
-- vim.pack.add({ "https://github.com/lambdalisue/vim-suda.git" })
-- vim.keymap.set("n", "<leader>wr", "<cmd>SudaWrite<cr>", { desc = "Sudo Write" })
-- vim.keymap.set("n", "<leader>oe", "<cmd>SudaRead<cr>", { desc = "Sudo Read" })

--
-- Copilot.vim
-- vim.pack.add({ "https://github.com/github/copilot.vim.git" })
vim.keymap.set("n", "<leader>c", "<cmd>Copilot setup<cr>", { desc = "Copilot" })

-- Vim-tmux-navigator
-- vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator.git" })
vim.keymap.set("n", "<m-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<m-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<m-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<m-l>", "<cmd>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<m-\\>", "<cmd>TmuxNavigatePrevious<cr>")
