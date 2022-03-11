-- lua/config/telescope.lua

local telescope = require("telescope")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
        color_devicons = true,
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                -- even more opts
            }),
        },
    },
})

telescope.load_extension("frecency")
telescope.load_extension("ui-select")
telescope.load_extension("node_modules")
