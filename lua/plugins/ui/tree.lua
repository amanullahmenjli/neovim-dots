return {
	"nvim-tree/nvim-tree.lua",

	dependencies = "nvim-tree/nvim-web-devicons",

	config = function()
		local nvimtree = require("nvim-tree")

		nvimtree.setup({
			-- tree appearance 
			view = {
				width = 30,
			},

			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {},
				},
			},

			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},

			git = {
				ignore = true,
			},
		})
	end
}
