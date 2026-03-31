-- Treesitter
-- vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter.git"})
require("nvim-treesitter").setup({
	-- Modules and its options go here
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = {
		enable = true,
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]]"] = { query = "@class.outer", desc = "Next class start" },
				--
				-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
				["]o"] = "@loop.*",
				-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
				--
				-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
				-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
				["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
				["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[]"] = "@class.outer",
			},
			-- Below will go to either the start or the end, whichever is closer.
			-- Use if you want more granular movements
			-- Make it even more gradual by adding multiple queries and regex.
			goto_next = {
				["]d"] = "@conditional.outer",
			},
			goto_previous = {
				["[d"] = "@conditional.outer",
			},
		},
	},
})
-- require('nvim-treesitter').install({
--     "rust",
--     "c",
--     "cpp",
--     "cmake",
--     "c_sharp",
--     "typescript",
--     "javascript",
--     "json",
--     "html",
--     "bash",
--     "python",
--     "toml",
--     "nix",
--     "lua",
-- })
--
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.keymap.set("n", "<leader>t", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
