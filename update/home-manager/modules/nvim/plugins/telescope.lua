--Telescope.nvim

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

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s.", function()
	builtin.live_grep(themes.get_dropdown({ winblend = 10, previewer = false }))
end, { desc = "[/] Live grep in current buffer" })

vim.keymap.set("n", "<leader>sd", function()
	builtin.diagnostics(themes.get_dropdown({ bufnr = 0, winblend = 10, previewer = false }))
end, { desc = "[S]earch [D]iagnostics" })
