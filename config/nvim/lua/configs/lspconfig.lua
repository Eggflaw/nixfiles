local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pylsp", "nil_ls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

require("luau-lsp").setup({
	plugin = {
		enabled = true,
	},
	server = {
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			["luau-lsp"] = {
				completion = {
					imports = {
						enabled = true,
						suggestServices = true,
					},
					autocompleteEnd = true,
				},
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
