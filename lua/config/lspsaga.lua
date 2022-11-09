-- config/lspsaga.lua
local lspsaga = require("lspsaga")

lspsaga.init_lsp_saga()

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = false, noremap = true })
vim.keymap.set("n", "<Leader>sd", "<cmd>Lspsaga peek_definition<CR>", { silent = false })
vim.keymap.set("n", "<Leader>la", "<cmd>Lspsaga code_action<CR>", { silent = false })
vim.keymap.set("n", "<Leader>le", "<cmd>Lspsaga lsp_finder<CR>", { silent = false })
vim.keymap.set("n", "<Leader>lr", "<cmd>Lspsaga rename<CR>", { silent = false })

-- Quiet down diagnostics so the Lspsaga is noteceable
vim.diagnostic.config({
    virtual_text = false,
})
