-- commands.lua

vim.cmd("autocmd!")

--[[
-- Command that get executed automatically
-- ]]
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "Hightlight any yanked line",
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
    desc = "When re-open a file, place the cursor at the last position",
})

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = [[if argc() == 0 | Explore! | endif]],
    desc = "If NeoVim is opened without parammeter, start NetRw on curren dir",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[:%s/\s\+$//e]],
    desc = "Remove all trailing whitespace on save",
})

-- Diagnostics info in the LSP popup. (No need to use `D`)
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])

-- :Format command to format code using LSP
vim.cmd("command! Format execute 'lua vim.lsp.buf.format({async = true})'")

-- :Actions command to execute LSP's code_action() function
vim.cmd("command! Actions execute 'lua vim.lsp.buf.code_action()'")
