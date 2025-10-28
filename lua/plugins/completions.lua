return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"moyiz/blink-emoji.nvim",
		"MahanRahmati/blink-nerdfont.nvim",
		"jdrupal-dev/css-vars.nvim",
		"bydlw98/blink-cmp-env",
		"disrupted/blink-cmp-conventional-commits",
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "enter",
			["<tab>"] = { "select_next", "fallback" },
			["<S-tab>"] = { "select_prev", "fallback" },
			["<C-CR>"] = { "accept", "fallback" },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
			keyword = { range = "full" },
			ghost_text = { enabled = true },
			list = { selection = { preselect = false, auto_insert = false } },
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local lspkind = require("lspkind")
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = {
				"lazydev",
				"lsp",
				"path",
				"snippets",
				"buffer",
				"emoji",
				"nerdfont",
				-- "env",
				"conventional_commits",
			},
			per_filetype = {
				sql = { "snippets", "dadbod", "buffer" },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
					should_show_items = function()
						return vim.tbl_contains(
							-- Enable emoji completion only for git commits and markdown.
							-- By default, enabled for all file-types.
							{ "gitcommit", "markdown" },
							vim.o.filetype
						)
					end,
				},
				nerdfont = {
					module = "blink-nerdfont",
					name = "Nerd Fonts",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
				},
				css_vars = {
					name = "css-vars",
					module = "css-vars.blink",
					opts = {
						-- WARNING: The search is not optimized to look for variables in JS files.
						-- If you change the search_extensions you might get false positives and weird completion results.
						search_extensions = { ".js", ".ts", ".jsx", ".tsx" },
					},
				},
				env = {
					name = "Env",
					module = "blink-cmp-env",
					--- @type blink-cmp-env.Options
					opts = {
						-- item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
						show_braces = false,
						show_documentation_window = true,
					},
				},
				conventional_commits = {
					name = "Conventional Commits",
					module = "blink-cmp-conventional-commits",
					enabled = function()
						return vim.bo.filetype == "gitcommit"
					end,
					---@module 'blink-cmp-conventional-commits'
					---@type blink-cmp-conventional-commits.Options
					opts = {}, -- none so far
				},
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
