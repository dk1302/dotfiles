--Blink.cmp
vim.pack.add({"https://github.com/folke/lazydev.nvim.git"})
vim.pack.add({{src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('*')}})
require('blink.cmp').setup({
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
  signature = { enabled = true }

})


-- Treesitter
vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter.git"})
require('nvim-treesitter').install({
  "rust",
  "c",
  "cpp",
  "cmake",
  "c_sharp",
  "typescript",
  "javascript",
  "json",
  "html",
  "bash",
  "python",
  "toml",
  "nix",
  "lua",
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})





-- Lsp setup
vim.pack.add({"https://github.com/neovim/nvim-lspconfig.git"})
local servers = { 
  rust_analyzer = {},
  clangd = {},
  csharp_ls = {},
  csharpier = {},
  ts_ls = {},
  lua_ls = {},
  nixd = {},
  pyright = {},
}
for server, config in pairs(servers) do
  config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end




--
-- -- Colorscheme
-- vim.pack.add({"https://github.com/rktjmp/lush.nvim.git"})
-- vim.pack.add({"https://github.com/zenbones-theme/zenbones.nvim.git"})
-- vim.pack.add({"https://github.com/folke/tokyonight.nvim.git"})
-- vim.pack.add({"https://github.com/scottmckendry/cyberdream.nvim.git"})
-- vim.pack.add({"https://github.com/mistweaverco/vhs-era-theme.nvim.git"})
-- require("cyberdream").setup({
--   overrides = function(colors)
--     return {
--       ["@keyword"] = { bold = true },
--       ["@function"] = { fg = colors.blue, bold = true },
--       ["@string"] = { fg = "#82cfff" },
--     }
--   end,
--
--   colors = {
--     blue = "#ffaed7",
--     fg = "#08bdba",
--     orange = "#33b1ff",
--     purple = "#5eff6c",
--   },
--   -- Load the colorscheme here.
-- })
-- vim.o.termguicolors = true
-- vim.o.background = "dark"
-- vim.cmd[[colorscheme cyberdream]]



-- Base settings and keymaps
local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }
map("", "<Space>", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.mouse = "a"
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
--
-- vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--
-- vim.keymap.set("n", "<M-]>", "<C-w>v", { desc = "Split window vertically" })
-- vim.keymap.set("n", "<M-/>", "<C-w>s", { desc = "Split window horizontally" })
-- vim.keymap.set("n", "<M-->", "<cmd>q!<cr>", { desc = "Close pane" })
-- vim.keymap.set("n", "<M-w>", "<cmd>w<cr>", { desc = "Save pane" })
--
-- vim.keymap.set("n", "<M-u>", "<C-d>zt")
-- vim.keymap.set("n", "<M-i>", "<C-u>zt")
-- vim.keymap.set("n", "<M-y>", "zt")
-- vim.keymap.set("n", "<M-o>", "zb")
--
-- vim.pack.add({"https://github.com/christoomey/vim-tmux-navigator.git"})
-- vim.keymap.set("n", "<m-h>", "<cmd>TmuxNavigateLeft<cr>")
-- vim.keymap.set("n", "<m-j>", "<cmd>TmuxNavigateDown<cr>")
-- vim.keymap.set("n", "<m-k>", "<cmd>TmuxNavigateUp<cr>")
-- vim.keymap.set("n", "<m-l>", "<cmd>TmuxNavigateRight<cr>")
-- vim.keymap.set("n", "<m-\\>", "<cmd>TmuxNavigatePrevious<cr>")





--
-- -- Mini.nvim
-- vim.pack.add({"https://github.com/nvim-mini/mini.nvim.git"})
-- require('mini.surround').setup({
--   mappings = {
--     add = "na", -- Add surrounding in Normal and Visual modes
--     delete = "nd", -- Delete surrounding
--     find = "nf", -- Find surrounding (to the right)
--     find_left = "nF", -- Find surrounding (to the left)
--     highlight = "nh", -- Highlight surrounding
--     replace = "nr", -- Replace surrounding
--
--     suffix_last = "", -- Suffix to search with "prev" method
--     suffix_next = "", -- Suffix to search with "next" method
--   },
-- })
-- require('mini.jump2d').setup({})







  -- Terminal

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<space>bo", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 25)

  job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<space>be", function()
  current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<space>ba", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)






-- Lsp diagnostics

vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  } or {},
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})





--Yazi

vim.pack.add({"https://github.com/mikavilpas/yazi.nvim.git"})
vim.keymap.set("n", "<leader>r", function()
  require("yazi").yazi()
end, { desc = "Yazi" })

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})





--Telescope

vim.pack.add({"https://github.com/nvim-lua/plenary.nvim.git"})
vim.pack.add({"https://github.com/BurntSushi/ripgrep.git"})
vim.pack.add({"https://github.com/nvim-telescope/telescope-fzf-native.nvim.git"})
vim.pack.add({"https://github.com/sharkdp/fd.git"})
vim.pack.add({"https://github.com/nvim-tree/nvim-web-devicons.git"})
vim.pack.add({"https://github.com/nvim-telescope/telescope.nvim.git"})
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
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

vim.keymap.set(
  "n",
  "<leader>e",
  "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
  { desc = "Open telescope buffers" })


vim.pack.add({"https://github.com/folke/which-key.nvim.git"})
require("which-key").setup({})
