local servers = {
	rust_analyzer = {},
	clangd = {},
	csharp_ls = {},
	csharpier = {},
	ts_ls = {},
	lua_ls = {},
	nixd = {},
	pyright = {},
	gdscript = {},
	bashls = {},
	tinymist = {},
	glsl_analyzer = {},
	html = {},
	cssls = {},
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "hl" },
			},
		},
	},
})

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
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = { implementation = "rust" },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },
})

-- vim.pack.add({ "https://github.com/neovim/nvim-lspconfig.git" })
for server, config in pairs(servers) do
	config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end
