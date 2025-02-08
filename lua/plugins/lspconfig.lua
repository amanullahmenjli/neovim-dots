return {
	"neovim/nvim-lspconfig",
	dependencies = { "b0o/schemastore.nvim" },
	config = function()
		local lspconfig = require("lspconfig")

		-- lua lsp settings
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		lspconfig.denols.setup({
			on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		})

		require("lspconfig").ts_ls.setup({})

		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		-- c/c++ lsp settings
		lspconfig.clangd.setup({})

		-- add astro.js LSP
		lspconfig.astro.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "astro" },
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<s-f6>", vim.lsp.buf.rename)
	end,
}
