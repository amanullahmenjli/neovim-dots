return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				-- Web dev
				"astro",
				"biome",
				"denols",

				-- C/C++ (temporarily disabled)
				"clangd",

				-- Other
				"lua_ls",
				"efm",
			},
			---@type boolean
			automatic_installation = true,
		})
	end,
}
