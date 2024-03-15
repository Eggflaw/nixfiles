require("nvchad.mappings")

local map = vim.keymap.set

local mappings = {
	n = {
		[";"] = { ":", { desc = "enter command mode", nowait = true } },

		["<leader>fm"] = {
			function()
				require("conform").format()
			end,
			{ desc = "Formatting" },
		},
	},
	v = {
		[">"] = { ">gv", { desc = "indent" } },
	},
}

for mode, maps in pairs(mappings) do
	for key, val in pairs(maps) do
		map(mode, key, val[1], val[2])
	end
end
