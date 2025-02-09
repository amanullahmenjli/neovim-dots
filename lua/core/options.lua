-- use tabs not spaces
vim.cmd("set noexpandtab")

-- set tab size to 4
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- set tab size to 2 for dart files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.dart" },
	callback = function()
		vim.cmd("set tabstop=2")
		vim.cmd("set softtabstop=2")
		vim.cmd("set shiftwidth=2")
	end,
})

-- enable line numbers
vim.cmd("set number")
-- vim.wo.relativenumber = true -- make the line numbers relative

-- add an 80 characters line length limit
vim.cmd("set colorcolumn=120")

-- allow using system clipboard
vim.cmd("set clipboard=unnamedplus")
