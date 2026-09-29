return {
	"neovim/nvim-lspconfig",

	config = function()
		-- Bash 
		vim.lsp.enable("bashls")

		-- Nix 
		vim.lsp.enable("nixd")

		local flake_expr = "builtins.getFlake (toString ./.)"

		vim.lsp.config.nixd = {
			cmd = { "nixd" },
			filetypes = { "nix" },
			root_markers = { "flake.nix", ".git" },
			settings = {
				nixd = {
					nixpkgs = {
						expr = string.format("import (%s).inputs.nixpkgs { }", flake_expr),
					},
					formatting = { command = { "${pkgs.nixfmt}/bin/alejandra" } },
					options = {
						home_manager = {
							expr = string.format(
								'(%s).homeConfigurations."mac@MacBook-Pro-de-Mac".options',
								flake_expr
							),
						},
						nix_darwin = {
							expr = string.format('(%s).darwinConfigurations."MacBook-Pro-de-Mac".options', flake_expr),
						},
					},
				},
			},
		}

		-- Ghostty 󰊠
		vim.lsp.config.ghostty = {
			cmd = { "ghostty-ls" },
			filetypes = { "ghostty" },
		}
		vim.lsp.enable("ghostty")

		vim.lsp.enable("ruff")

		vim.lsp.enable("ty")

		vim.lsp.enable("clangd")

		-- Rust 
		vim.lsp.enable("rust_analyzer")

		-- Lua 󰢱
		vim.lsp.enable("lua_ls")

		vim.lsp.enable("matlab_ls")

		-- Tailwindcss 
		vim.lsp.enable("tailwindcss-language-server")

		-- Lua 󰢱
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- YAML 
		vim.filetype.add({
			pattern = {
				[".*/.yamlfmt"] = "yaml",
				[".*/.gdextension"] = "toml",
				-- [".*/ghostty/config"] = "ghostty"
			},
		})

		vim.lsp.config("yamlls", {
			filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yamlfmt" },
			settings = {
				yaml = {
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						-- ["https://codemagic.io/codemagic-schema.json"] = "/.codemagic.yaml",
					},
				},
			},
		})

		vim.lsp.config("gh_actions_ls", {
			pattern = {
				["./github/workflows/.yml"] = "yaml",
			},
		})
	end,
}
