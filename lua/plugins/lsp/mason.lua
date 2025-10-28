return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Web dev 󰖟
					"superhtml", -- 

					-- Rust 
					"rust_analyzer",

					-- Lua 󰢱
					"lua_ls",

					-- The snake 󱔎
					"ruff",

					-- Configurations 
					"hyprls", -- 

					-- Web dev
					"astro", -- 
					"biome",

					-- C/C++ 
					"clangd",

					-- Configurations
					"lua_ls",
					"efm",
					"yamlls",
					--
				},
				---@type boolean
				automatic_installation = true,
			})
		end,
	},
}
