-- Set the leader key
vim.g.mapleader = " "

-- load lazy package manager
require("Lazy")

-- load neovim settings
require("core.options")

-- load keybindings
require("core.keybindings")

-- load the appearance settings
require("core.appearance")

-- load languages specific configurations
require("core.langs")

-- load the autoclose plugin
require("nvim-autopairs").setup()

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function(event)
		print(string.format("starting hyprls for %s", vim.inspect(event)))
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
