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

-- load the autoclose plugin
require("nvim-autopairs").setup()

-- add hyprland syntax support
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

vim.api.nvim_create_user_command("Prose", function()
	require("utils").save_and_exec()
end, { nargs = 0, desc = "Apply prose settings" })

vim.g.c_syntax_for_h = 1
