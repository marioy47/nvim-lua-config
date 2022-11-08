-- lua/confing/which-key.lua

require("which-key").setup({
    plugins = {
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        },
    },
    popup_mappings = {
        scroll_down = "<c-n>", -- binding to scroll down inside the popup
        scroll_up = "<c-p>", -- binding to scroll up inside the popup
    },
    window = {
        margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
    },
})
