-- use tabs not spaces
vim.cmd("set noexpandtab")

-- disable line wrap
vim.cmd("set nowrap")

-- set tab size to 4
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- enable line numbers
vim.cmd("set number")
vim.wo.relativenumber = false -- make the line numbers relative

-- add an 80 characters line length limit
vim.cmd("set colorcolumn=120")

-- allow using system clipboard
vim.cmd("set clipboard=unnamedplus")

-- show diagnostics at current line
vim.diagnostic.config({ virtual_text = { current_line = true } })

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.linebreak = true
