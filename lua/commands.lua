-- commands.lua

vim.cmd 'autocmd!'

-- [[ Autocommands ]] --

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = 'Highlight any yanked line',
})

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
  desc = 'When re-open a file, place the cursor at the last position',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[:%s/\s\+$//e]],
  desc = 'Remove all trailing white space on save',
})

--[[ User Commands ]]
--

vim.api.nvim_create_user_command('Actions', 'lua vim.lsp.buf.code_action()', {
  desc = "Use `:Actions` command to execute LSP's code_action() function",
})

vim.api.nvim_create_user_command('Diagnostics', 'lua vim.diagnostics.setloclist()', {
  desc = 'Toggle Diagnostics',
})
