-- All language specific configurations are defined here

--  Hyprlang
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

--  Dart/Flutter
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.dart" },
	callback = function()
		vim.cmd("set tabstop=2")
		vim.cmd("set softtabstop=2")
		vim.cmd("set shiftwidth=2")
	end,
})

--  C/C++
vim.g.c_syntax_for_h = 1
