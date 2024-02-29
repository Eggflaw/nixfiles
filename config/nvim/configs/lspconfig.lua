local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pylsp", "rust_analyzer", "nil_ls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

require("luau-lsp").setup({
	server = {
		settings = {
			["luau-lsp"] = {
				require = {
					mode = "relativeToFile",
					directoryAliases = {
						["@lune/"] = "~/.lune/.typedefs/0.8.0/",
					},
				},
			},
		},
	},
})

--
-- lspconfig.pyright.setup { blabla}
