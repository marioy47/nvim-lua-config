-- lua/confing/which-key.lua

require("which-key").setup({
    plugins = {
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        },
    },
    window = {
        margin = { 0, 0, 0, 0 }, -- remove window margin [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- remove window padding [top, right, bottom, left]
    },
})
