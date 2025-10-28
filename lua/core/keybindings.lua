-- open file explorer
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeOpen<CR>")

-- refresh file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")

-- show hover info
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

-- rename a symbol
vim.keymap.set("n", "<f2>", vim.lsp.buf.rename)

-- Jump to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "f", "za")

vim.keymap.set("n", "C-a", "gcc")

vim.keymap.set("n", "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
