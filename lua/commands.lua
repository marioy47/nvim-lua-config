-- commands.lua

-- Hightlight any yanked line
vim.cmd [[
  augroup highlight-text-on-yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- When re-open a file, place the cursor at the last position
vim.cmd[[
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]]

-- If NeoVim is open without parammeter, start NetRw on curren dir
vim.cmd[[
augroup netrw-auto-open-if-no-params
  autocmd!
  autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END
]]

-- :Clear command to remove any active highlight
vim.cmd("command! Clear execute 'noh'")

-- :Format command to format code using LSP
vim.cmd("command! Format execute 'lua vim.lsp.buf.formatting()'")

-- :Actions command to execute LSP's code_action() function
vim.cmd("command! Actions execute 'lua vim.lsp.buf.code_action()'")

-- Autocommand to format using alternative linter
vim.cmd("au BufWritePost <buffer> lua require('lint').try_lint()")
vim.cmd[[command! Lint execute "lua require('lint').try_lint()"]]

