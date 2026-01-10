vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<M-]>", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<M-/>", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<M-->", "<cmd>q!<cr>", { desc = "Close pane" })
vim.keymap.set("n", "<M-w>", "<cmd>w<cr>", { desc = "Save pane" })

vim.keymap.set("n", "<M-u>", "<C-d>zt")
vim.keymap.set("n", "<M-i>", "<C-u>zt")
vim.keymap.set("n", "<M-y>", "zt")
vim.keymap.set("n", "<M-o>", "zb")

-- vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator.git" })
vim.keymap.set("n", "<m-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<m-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<m-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<m-l>", "<cmd>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<m-\\>", "<cmd>TmuxNavigatePrevious<cr>")

vim.keymap.set("n", "<leader>t", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
vim.keymap.set("n", "<leader>c", "<cmd>Copilot setup<cr>", { desc = "Copilot" })
vim.keymap.set({ "n", "v" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
-- Telescope keymaps

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ winblend = 10, previewer = false }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

vim.keymap.set(
	"n",
	"<leader>e",
	"<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
	{ desc = "Open telescope buffers" }
)

-- Suda Keymaps

vim.keymap.set("n", "<leader>wr", "<cmd>SudaWrite<cr>", { desc = "Sudo Write" })

vim.keymap.set("n", "<leader>oe", "<cmd>SudaRead<cr>", { desc = "Sudo Read" })
