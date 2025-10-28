-- open file explorer
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeOpen<CR>")

-- refresh file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")

-- show hover info
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

-- rename a symbol
vim.keymap.set("n", "<f2>", vim.lsp.buf.rename)

-- jump to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- open fold
vim.keymap.set("n", "f", "za")
