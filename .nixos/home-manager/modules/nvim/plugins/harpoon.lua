-- Harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Harpoon Add File" })

vim.keymap.set("n", "<m-p>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<m-[>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<m-]>", function()
	harpoon:list():next()
end)
