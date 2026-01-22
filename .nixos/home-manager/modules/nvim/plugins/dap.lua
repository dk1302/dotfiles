local dap = require("dap")

-- GDB configuration
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}
dap.configurations.cpp = dap.configurations.c

-- Rust-gdb configuration
dap.adapters["rust-gdb"] = {
	type = "executable",
	command = "rust-gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}
dap.configurations.rust = {
	{
		name = "Launch",
		type = "rust-gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}

vim.keymap.set("n", "<leader>Ds", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<leader>Do", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<leader>Di", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<leader>De", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>Dt", function()
	require("dapui").toggle()
end)
vim.keymap.set("n", "<leader>Dr", function()
	require("dap").run_last()
end)

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	controls = {
		icons = {
			pause = "⏸",
			play = "▶",
			step_into = "⤵",
			step_over = "⤼",
			step_out = "⤴",
			step_back = "⏮",
			run_last = "↻",
			terminate = "⏹",
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	require("dapui").open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	require("dapui").close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	require("dapui").close()
end

require("nvim-dap-virtual-text").setup()
