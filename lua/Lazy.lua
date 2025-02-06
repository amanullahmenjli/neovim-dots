-- get the path to lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- install lazy if it's not installed
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- update the path to lazy
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.coding" },
	{ import = "plugins.ui" },
	{ import = "plugins.languages-support" }, -- managing LSPs, formatters, linters and DAPs
	{ import = "plugins.languages-support.syntax-plugins" }, -- managing LSPs, formatters, linters and DAPs
})
