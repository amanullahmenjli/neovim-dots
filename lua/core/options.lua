-- use tabs not spaces
vim.cmd("set noexpandtab")

-- set tab size to 4
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- enable line numbers
vim.cmd("set number")
-- vim.wo.relativenumber = true -- make the line numbers relative

-- add an 80 characters line length limit
vim.cmd("set colorcolumn=120")

-- allow using system clipboard
vim.cmd("set clipboard=unnamedplus")
