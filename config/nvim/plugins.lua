local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	-- My plugins
	{
		"elkowar/yuck.vim",
		lazy = true,
		ft = "yuck",
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				SECTION = { icon = "§", color = "info" },
			},
		},
		lazy = false,
	},

	{
		"lopi-py/luau-lsp.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("custom.configs.conform")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"vimdoc",
				"lua",

				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"json",

				"toml",
				"rust",

				"python",

				"nix",
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
