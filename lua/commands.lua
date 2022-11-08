-- commands.lua

vim.cmd("autocmd!")

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

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    command = [[lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]],
    desc = "Diagnostics info in the LSP popup. (No need to use `D`)",
})

vim.api.nvim_create_user_command("Format", "lua vim.lsp.buf.format({async = true})", {
    desc = "Use :Format to format the code using any supported Language Server",
})

vim.api.nvim_create_user_command("Actions", "lua vim.lsp.buf.code_action()", {
    desc = "Use :Actions command to execute LSP's code_action() function",
})

vim.api.nvim_create_user_command("Colors", "print getcompletion('', 'colorscheme')", {
    desc = "Use :Actions command to execute LSP's code_action() function",
})
