return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
	},

	config = function()
		require("barbecue").setup({
lead_custom_section = function()
        return { { " ", "WinBar" } }
      end,
		})
	end
}
