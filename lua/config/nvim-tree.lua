-- lua/config/nvim-tree.lua
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_add_trailing = 1
-- vim.g.nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE", "package.json", "composer.json" }
-- vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 1 }

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
