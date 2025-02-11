return {
	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({

			project = vim.fn.getcwd(),
			formatters = {
				clangfmt = {
					command = "clang-format",
					args = '--style="{IndentWidth: 4, AlignAfterOpenBracket: AlwaysBreak}"',
				},
				dartfmt = {
					command = "dart",
					args = "format --line-length 140 $project",
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
				timeout_ms = 5000,
			},
		})

		conform.formatters.dart_format = {
			prepend_args = { "--line-length 140 $project" },
			-- The base args are { "-filename", "$FILENAME" } so the final args will be
			-- { "-i", "2", "-filename", "$FILENAME" }
		}
	end,
}
