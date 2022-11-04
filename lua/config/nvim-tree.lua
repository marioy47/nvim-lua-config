-- lua/config/nvim-tree.lua

require("nvim-tree").setup({
    view = {
        width = 45,
        side = "right",
        mappings = {
            list = {
                { key = "<C-k>", action = "" },
                { key = "i", action = "toggle_file_info" },
            },
        },
    },
    renderer = {
        add_trailing = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = "after",
        },
        special_files = { "README.md", "Makefile", "MAKEFILE", "package.json", "composer.json" },
        highlight_git = false,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
    },
    git = {
        ignore = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        },
    },
})
