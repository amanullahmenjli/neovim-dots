return {
	"aznhe21/actions-preview.nvim",
	config = function()
		vim.keymap.set({ "v", "n" }, "<M-CR>", require("actions-preview").code_actions)
	end,
}
