-- Base settings and keymaps
local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }

map("", "<Space>", "<Nop>", silent)
map("", "s", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.autochdir = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = ".", nbsp = "_" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 3
vim.opt.confirm = true
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox-material]])

vim.keymap.set("n", "<M-->", "<cmd>qa!<cr>", { desc = "Close all pane" })
vim.keymap.set("n", "-", "<cmd>q!<cr>", { desc = "Close current pane" })
vim.keymap.set("n", "<M-w>", "<cmd>w<cr>", { desc = "Save pane" })

vim.keymap.set({ "n", "v" }, "<M-u>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<M-i>", "<C-u>zz")

vim.keymap.set("n", "<leader>t", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

vim.o.clipboard = "unnamedplus"
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})
