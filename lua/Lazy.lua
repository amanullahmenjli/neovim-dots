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
	{ import = "plugins.ui" },
	{ import = "plugins.languages-support" }, -- managing LSPs, formatters, linters and DAPs
	{ import = "plugins.lsp" }, -- managing LSPs, formatters, linters and DAPs
	{ import = "plugins.languages-support.syntax-plugins" }, -- managing LSPs, formatters, linters and DAPs
})

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (" 󰁂 %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end

require("ufo").setup({
	fold_virt_text_handler = handler,
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Normal",
			winblend = 1,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
			jumpTop = "[",
			jumpBot = "]",
		},
	},
})
vim.o.foldenable = false
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
