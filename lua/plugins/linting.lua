return {
	"mfussenegger/nvim-lint",

	event = {
		"bufreadpre",
		"bufnewfile",
	},

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "deno" },
			typescript = { "deno" },
			javascriptreact = { "deno" },
			typescriptreact = { "deno" },
			svelte = { "deno" },
			json = { "jsonlint" },
		}
	end,
}
