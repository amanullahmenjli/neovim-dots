return {
	{
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
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				ensure_installed = {
					--  neovim
					"lua",
					"vim",
					"vimdoc",
					"query",

					-- 󰖟 web dev
					"html",
					"css",
					"javascript",
					"typescript",
					"astro",
					"tsx",

					--  Godot
					"gdscript",

					--  data
					"json",
					"yaml",
					"toml",

					--  system configs
					"hyprlang",
					"rasi",

					-- 󰅩 scripting
					"bash",

					--  git
					"gitignore",

					-- other langs
					"c",
					"python",

					--  databases
					"sql",
				},

				-- Automatically install missing parsers when entering buffer
				auto_install = true,

				-- Enable highlight
				highlight = { enable = true },

				-- Enable indentation
				indent = { enable = true },

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
						node_incremental = "<leader>si",
						scope_incremental = "<leader>sc",
						node_decremental = "<leader>sd",
					},
				},

				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true or false
						include_surrounding_whitespace = true,
					},
				},

				modules = {},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- List of parsers to ignore installing (or "all")
				ignore_install = { "org" },
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
					[".*/hypr/*.conf"] = "hyprlang",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
