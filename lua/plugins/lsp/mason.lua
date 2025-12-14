return {
	{
		"williamboman/mason.nvim",
		priority = 2000,
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Web dev 󰖟
					"superhtml", -- 

					-- Nix 
					"nil",
					"nixfmt",

					-- University needs
					"matlab-language-server",

					-- Bash 
					"bash-language-server",
					"beautysh",

					-- Fish 
					"fish-lsp",

					-- Godot 
					"gdtoolkit",

					-- Rust 
					"rust-analyzer",

					-- Lua 󰢱
					"lua-language-server",

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
