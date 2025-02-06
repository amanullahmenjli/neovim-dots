--[[ return {
	"folke/tokyonight.nvim",
	lazy = false,
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	config = function()
		require("tokyonight").setup({
			style = "night",
		})
	end,
} ]]
--

return {
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
