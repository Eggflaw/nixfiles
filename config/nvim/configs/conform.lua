local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },

		sh = { "shfmt" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},

	notify_on_error = true,
}

require("conform").setup(options)
