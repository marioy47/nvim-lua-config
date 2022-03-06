-- lua/config/telescope.lua

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
			},
		},
	},
})
require("telescope").load_extension("frecency")
