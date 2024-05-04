local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- My plugins
  {
    "elkowar/yuck.vim",
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
    event = "BufReadPost",
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss { silent = true, pending = true }
        end,
        desc = "Dismiss All Notifications",
      },
    },
    init = function(_)
      vim.notify = require "notify"
    end,
  },

  {
    "lopi-py/luau-lsp.nvim",
    ft = "luau",
    config = function(_)
      require "configs.luau-lsp"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
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
