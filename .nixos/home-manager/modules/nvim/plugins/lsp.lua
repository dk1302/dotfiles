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
  cssls = {}
}

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
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

-- Lsp setup
-- vim.pack.add({ "https://github.com/neovim/nvim-lspconfig.git" })
for server, config in pairs(servers) do
	config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function (args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     if not client then return end
--
--     if client:supports_method('textDocument/formatting') then
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         buffer = args.buf,
--         callback = function ()
--           vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
--         end,
--       })
--     end
--   end,
-- })
