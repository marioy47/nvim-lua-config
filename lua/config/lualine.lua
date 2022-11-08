-- config/lualine.lua

require("lualine").setup({
    sections = { -- All sections here: https://github.com/nvim-lualine/lualine.nvim#available-components
        lualine_a = {},
        lualine_b = { "branch", "diagnostics" },
        lualine_c = {
            {
                "filename",
                file_status = true,
                path = 1, -- show relativ path
                shorting_target = 40,
                symbols = { modified = "[]", readonly = " " },
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
            },
            "diff",
            "fileformat",
            "filetype",
        },
        lualine_y = { "progress", "location" },
        lualine_z = { "searchcount" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
})
