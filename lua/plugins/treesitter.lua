return {
	"nvim-treesitter/nvim-treesitter",

	-- Load the plugin when a file is opened or created
	event = { "BufReadPre", "BufNewFile" },

	build = ":TSUpdate",

	-- It needs nvim-ts-autotag to autoclose and autorename html tags
	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	-- The plugin configurations
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			-- Enable highlight
			highlight = { enable = true },

			-- Enable indentation
			indent = { enable = true },

			-- Automatically install missing parsers when entering buffer
			auto_install = true,

			ensure_installed = {
				-- neovim
				"lua",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"astro",
				"tsx",

				-- data
				"json",
				"yaml",
				"toml",

				-- system configs
				"hyprlang",
				"rasi",

				-- scripting
				"bash",

				-- git
				"gitignore",

				-- other langs
				"c",
				"python",
			},
		})

		vim.filetype.add({
			-- map file extensions to filetypes
			extension = {
				-- rofi/wofi config files
				rasi = "rasi",
				rofi = "rasi",
				wofi = "rasi",

				-- kvantum themes
				kvconfig = "toml",
			},

			pattern = {
				-- hyprland
				[".*/hypr/.*%.conf"] = "hyprlang",
			},
		})
	end,
}
