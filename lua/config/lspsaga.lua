-- config/lspsaga.lua
local lspsaga = require("lspsaga")

lspsaga.init_lsp_saga()

local opts = { noremap = true, silent = false }
vim.keymap.set("n", "<Leader>dn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<Leader>dp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "<Leader>dl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga lsp_finder<CR>", opts)
-- vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
-- vim.keymap.set("n", "<Leader>la", "<Cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<Leader>lr", "<Cmd>Lspsaga rename<CR>", opts)

-- Quiet down diagnostics so the Lspsaga is noteceable
vim.diagnostic.config({
    virtual_text = false,
})
