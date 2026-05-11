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
vim.o.termguicolors = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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

--Blink.cmp (Must be before lspconfig setup)
-- vim.pack.add({ "https://github.com/folke/lazydev.nvim.git" })
-- vim.pack.add({ { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('*') } })
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<M-y>"] = { "select_and_accept" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer", "lazydev" },
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
		},
	},

	fuzzy = { implementation = "rust" },

	-- Shows a signature help window while you type arguments for a function
	signature = { enabled = true },
})
