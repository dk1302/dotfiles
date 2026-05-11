vim.keymap.set("n", "<M-->", "<cmd>qa!<cr>", { desc = "Close all pane" })
vim.keymap.set("n", "-", "<cmd>q!<cr>", { desc = "Close current pane" })
vim.keymap.set("n", "<M-w>", "<cmd>w<cr>", { desc = "Save pane" })

-- Buffer navigation
vim.keymap.set({ "n", "v" }, "<M-u>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<M-i>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<M-y>", "H")
vim.keymap.set({ "n", "v" }, "<M-o>", "L")
-- vim.keymap.set({"n", "v"}, "<M-m>", "M")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>t", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
