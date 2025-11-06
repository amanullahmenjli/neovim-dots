-- Set the leader key
vim.g.mapleader = " "

-- load lazy package manager
require("Lazy")

-- load neovim settings
require("core.options")

-- load keybindings
require("core.keybindings")

-- load languages specific configurations
require("core.langs")

-- load the autoclose plugin
require("nvim-autopairs").setup()
