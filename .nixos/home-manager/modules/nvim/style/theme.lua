-- Colorscheme
-- vim.pack.add({"https://github.com/norcalli/nvim-colorizer.lua.git"})
require("colorizer").setup()
-- termguicolors option moved to init.lua
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox-material]])
