require "nvchad.options"

vim.cmd [[au BufRead,BufNewFile *.luau set filetype=luau]]

vim.opt.termguicolors = true
vim.o.exrc = true

require("luasnip").filetype_extend("luau", { "lua" })
