local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

require("luau-lsp").setup {
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
}
