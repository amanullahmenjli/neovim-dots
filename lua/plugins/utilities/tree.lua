return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
		"antosha417/nvim-lsp-file-operations",
	},
	lazy = false, -- neo-tree will lazily load itself

	window = {
		position = "left",
		width = 30,
	},

	config = function()
		vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>")

		require("neo-tree").setup({
			window = {
				position = "left",
				width = 30,
			},
		})

		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})
	end,
}
