-- lua/config/nvim-tree.lua

require("nvim-tree").setup({
	auto_close = false,
	diagnostics = {
		enable = true,
	},
	view = {
		width = 40,
		side = "right",
	},
})
