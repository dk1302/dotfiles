--Telescope.nvim

-- vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim.git" })
-- vim.pack.add({ "https://github.com/BurntSushi/ripgrep.git" })
-- vim.pack.add({ "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git" })
-- vim.pack.add({ "https://github.com/sharkdp/fd.git" })
-- vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons.git" })
-- vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim.git" })
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- Telescope keymaps

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s.", function()
	builtin.live_grep(themes.get_dropdown({ winblend = 10, previewer = false }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>sd", function()
	builtin.diagnostics(themes.get_dropdown({ bufnr = 0, winblend = 10, previewer = false }))
end, { desc = "[S]earch [D]iagnostics" })
