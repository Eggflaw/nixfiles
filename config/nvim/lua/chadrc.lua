---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.ui = {
	theme = "catppuccin",
	theme_toggle = { "catppuccin", "one_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,
}

return M
