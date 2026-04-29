return {
	"neovim/nvim-lspconfig",

	config = function()
		-- Bash 
		vim.lsp.enable("bashls")

		-- Nix 
		vim.lsp.enable("nil_ls")

		-- Vue 
		vim.lsp.enable("vue_ls")

		vim.lsp.enable("vtsls")

		vim.lsp.enable('ruff')

		vim.lsp.enable("ty")

		vim.lsp.enable("clangd")

		-- Rust 
		vim.lsp.enable("rust_analyzer")

		-- Lua 󰢱
		vim.lsp.enable("lua_ls")

		-- Nix 
		vim.lsp.enable("nil")

		-- Hyprland 
		vim.lsp.enable("hyprls")

		-- HTML 
		vim.lsp.enable("superhtml")

		vim.lsp.enable("matlab_ls")

		-- Typescript 
		vim.lsp.enable("biome")

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				if not client then
					return
				end

				-- When the client is Biome, add an automatic event on
				-- save that runs Biome's "source.fixAll.biome" code action.
				-- This takes care of things like JSX props sorting and
				-- removing unused imports.
				if client.name == "biome" then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
						callback = function()
							vim.lsp.buf.code_action({
								context = {
									only = { "source.fixAll.biome" },
									diagnostics = {},
								},
								apply = true,
							})
						end,
					})
				end
			end,
		})


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
