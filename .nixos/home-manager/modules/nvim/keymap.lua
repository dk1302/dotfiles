-- Pane Navigation
vim.keymap.set("n", "<M-h>", function()
	vim.cmd.wincmd("h")
end, { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", function()
	vim.cmd.wincmd("l")
end, { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-j>", function()
	vim.cmd.wincmd("j")
end, { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-k>", function()
	vim.cmd.wincmd("k")
end, { desc = "Move focus to the left window" })

vim.keymap.set("n", "<M-]>", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<M-/>", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<M-->", "<cmd>qa!<cr>", { desc = "Close all pane" })
vim.keymap.set("n", "-", "<cmd>q!<cr>", { desc = "Close current pane" })
vim.keymap.set("n", "<M-q>", function()
	vim.cmd.wincmd("t")
	vim.cmd.quit()
	vim.cmd.wincmd("b")
	vim.cmd.quit()
end, { desc = "Close side panes" })
vim.keymap.set("n", "<M-w>", "<cmd>w<cr>", { desc = "Save pane" })

-- Buffer navigation
vim.keymap.set({"n", "v"}, "<M-u>", "<C-d>zz")
vim.keymap.set({"n", "v"}, "<M-i>", "<C-u>zz")
vim.keymap.set({"n", "v"}, "<M-y>", "H")
vim.keymap.set({"n", "v"}, "<M-o>", "L")
vim.keymap.set({"n", "v"}, "<M-m>", "M")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Terminal
local job_id = 0
vim.keymap.set("n", "<space>bo", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("H")
	vim.api.nvim_win_set_width(0, 75)

	job_id = vim.bo.channel
end, { desc = "Open terminal" })

local current_command = ""
vim.keymap.set("n", "be", function()
	current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "ba", function()
	if current_command == "" then
		current_command = vim.fn.input("Command: ")
	end

	vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)
