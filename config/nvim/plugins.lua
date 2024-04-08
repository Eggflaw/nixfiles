local overrides = require("configs.overrides")

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
		ft = "luau",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("configs.conform")
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
}

return plugins
