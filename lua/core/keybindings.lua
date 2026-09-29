-- show hover info
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

-- clean up search
vim.keymap.set("n", "\\", "<cmd>noh<CR>")

-- rename a symbol
vim.keymap.set("n", "<f2>", vim.lsp.buf.rename)

-- jump to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- open fold
vim.keymap.set("n", "f", "za")
