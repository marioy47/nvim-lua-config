-- lua/config/nvim-tree.lua
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_add_trailing = 1

require("nvim-tree").setup({
    auto_close = true,
    diagnostics = {
        enable = true,
    },
    git = {
        ignore = false,
    },
    view = {
        width = 40,
        side = "right",
        mappings = {
            list = {
                { key = "<C-k>", action = "" },
                { key = "<C-i>", action = "toggle_file_info" },
            },
        },
    },
})
