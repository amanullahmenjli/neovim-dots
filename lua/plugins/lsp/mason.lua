return {
	{
		"williamboman/mason.nvim",
		priority = 2000,
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:mkindberg/ghostty-ls",
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Terminal 
					"ghostty-ls",

					-- Web dev 󰖟
					"superhtml", -- 

					-- Bash 
					"bash-language-server",
					"beautysh",

					-- Fish 
					"fish-lsp",

					-- Godot 
					"gdtoolkit",

					-- Rust 
					"rust-analyzer",

					-- The snake 󱔎
					"ruff",

					-- Configurations 
					"hyprls", -- 

					-- Web dev
					"astro-language-server",
					"biome",
					"prettier",

					-- C/C++ 
					"clangd",

					-- Configurations
					"efm",
					"yaml-language-server",
				},
			})
		end,
	},
}
