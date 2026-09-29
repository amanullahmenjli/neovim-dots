-- Deno 
vim.lsp.enable("denols")

vim.lsp.config("denols", {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
	root_markers = { "deno.json", "deno.jsonc" },
})

vim.lsp.enable("oxlint")

vim.lsp.enable("eslint")

vim.lsp.config("eslint", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"astro",
		"json",
		"jsonc",
		"markdown",
	},
})

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
	on_attach = function(client, bufnr)
		if not base_on_attach then
			return
		end

		base_on_attach(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "LspEslintFixAll",
		})
	end,
})
