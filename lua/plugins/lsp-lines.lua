return {
	"https://codeberg.org/amanullahmenjli/lsp_lines",
	config = function()
		require("lsp_lines").setup()
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
