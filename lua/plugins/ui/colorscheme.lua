return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,

			-- Enable italics comments
			italic_comments = true,

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = true,

			-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
			borderless_pickers = false,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
			cache = false,
		},
	},

	--[[	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},]]
	--
}
