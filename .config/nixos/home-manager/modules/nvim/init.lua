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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if not client then return end

    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})






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


vim.pack.add({"https://github.com/folke/which-key.nvim.git"})
require("which-key").setup({})

vim.pack.add({"https://github.com/lambdalisue/vim-suda.git"})
