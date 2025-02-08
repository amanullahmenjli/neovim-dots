return {
	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				clangfmt = {
					command = "clang-format",
					args = '--style="{IndentWidth: 4, AlignAfterOpenBracket: AlwaysBreak}"',
				},
				dartfmt = {
					command = "dart",
					args = "format",
				},
			},
			formatters_by_ft = {
				c = { "clangfmt" },
				h = { "clangfmt" },
				html = { "prettierd" },
				css = { "prettierd" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				typescript = { "deno_fmt" },
				jsonc = { "prettierd" },
				json = { "prettier" },
				lua = { "stylua" },
				astro = { "prettier" },
				rasi = { "lsp" },
				nix = { "nixfmt" },
				fish = { "fish_indent" },
				yaml = { "yamlfix" },
				dart = { "dartfmt" },
			},
			format_on_save = {
				-- lsp_fallback = true,
				async = false,
			},
		})

		conform.formatters.clang_format = {

			prepend_args = { "-style=", '"{IndentWidth: 4}"', "-i", "$FILENAME" },
			-- The base args are { "-filename", "$FILENAME" } so the final args will be
			-- { "-i", "2", "-filename", "$FILENAME" }
		}
	end,
}
