-- Auto-session
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
