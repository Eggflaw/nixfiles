local lint = require("lint")

lint.linters_by_ft = {
	lua = { "selene" },
	luau = { "selene" },
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "TextChanged", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
