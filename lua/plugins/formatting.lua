return {
	"stevearc/conform.nvim",

	dependencies = { "zapling/mason-conform.nvim" },

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")
		local mason_conform = require("mason-conform")

		mason_conform.setup({})

		conform.setup({
			project = vim.fn.getcwd(),

			-- Define custom formatters
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
				-- Configurations
				jsonc = { "biome" },
				json = { "biome" },
				rasi = { "lsp" },
				nix = { "nixfmt" },
				yaml = { "yamlfmt" },

				sql = { "sqlfmt" },

				-- Scripting
				bash = { "beautysh" },
				sh = { "beautysh" },
				fish = { "fish_indent" },
				lua = { "stylua" },

				-- C/C++
				c = { "clangfmt" },
				h = { "clangfmt" },

				-- Godot 
				gdscript = { "gdformat" },

				-- Web dev
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "biome" },
				typescriptreact = { "biome" },
				typescript = { "biome" },
				astro = { "prettier" },

				-- Flutter
				dart = { "dart_format" },

				-- Snake 󱔎
				python = { "ruff" },
			},

			format_on_save = {
				lsp_fallback = true,
				lsp_format = "fallback",
				async = false,
				timeout_ms = 5000,
			},

			default_format_opts = {
				lsp_format = "fallback",
			},
		})
	end,
}
