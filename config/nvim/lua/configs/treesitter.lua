local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
local home_dir = os.getenv("USERPROFILE") or os.getenv("HOME")

-- NOTE: Luau parser
local luau_parser_path = home_dir .. "/Downloads/tree-sitter-luau"

parser_config.luau = {
	install_info = {
		url = luau_parser_path,
		files = { "src/parser.c", "src/scanner.c" },
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
}
-- set queries for luau.
do
	for _, v in pairs({ "highlights", "indents", "folds", "injections", "locals" }) do
		local fd = io.open(luau_parser_path .. "/nvim-queries/" .. v .. ".scm")
		if not fd then
			print("Path not found")
			return
		end
		local txt = fd:read("*a")
		fd:close()
		vim.treesitter.query.set("luau", v, txt)
	end
end
