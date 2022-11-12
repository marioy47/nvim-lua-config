-- config/telescope.lua

require("telescope").setup({
    defaults = {
        sorting_strategy = "ascending",
        --     layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            width = 0.9,
            height = 0.90,
        },
    },
})

vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", {})
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set("n", "<Leader>fr", "<cmd>Telescope registers<cr>", {})
vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", {})
vim.keymap.set("n", "<Leader>fo", "<cmd>Telescope lsp_document_symbols<cr>")

vim.api.nvim_create_user_command("GitStatus", "Telescope git_status", { desc = "Show status of files" })
