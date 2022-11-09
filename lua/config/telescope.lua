-- config/telescope.lua

require("telescope").setup({
    defaults = {
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
    },
})

vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", {})
vim.keymap.set("n", "<Leader>fy", "<cmd>Telescope symbols<cr>", {})
