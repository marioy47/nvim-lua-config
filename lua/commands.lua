-- commands.lua

-- Hightlight any yanked line
vim.cmd([[
  augroup highlight-text-on-yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- When re-open a file, place the cursor at the last position
vim.cmd([[
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]])

-- If NeoVim is opened without parammeter, start NetRw on curren dir
vim.cmd([[
augroup netrw-auto-open-if-no-params
  autocmd!
  autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END
]])

-- Remove all trailing whitespace on save
vim.api.nvim_exec(
    [[
  augroup trim-white-space-on-save
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
  ]],
    false
)

-- Prevent new line to also start with a comment
vim.api.nvim_exec(
    [[
  augroup disable-comments-on-new-lines
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
]],
    false
)

-- Hello

-- Diagnostics info in the LSP popup. (No need to use `D`)
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])

-- Material Theme
vim.cmd([[command! MaterialToggle execute "lua require('material.functions').toggle_style()"]])

-- :Git opens NeoGit on the sidebar
vim.cmd([[command! Diffsplit execute "Gitsigns diffthis"]])

-- :Tstatus command to shows Telescope's git_status()
vim.cmd([[command! Tstatus execute "lua require(\"telescope.builtin\").git_status()"]])
vim.cmd([[command! Tgrep execute "lua require(\"telescope.builtin\").live_grep()"]])
vim.cmd([[command! Ttags execute "lua require(\"telescope.builtin\").help_tags()"]])

-- :Format command to format code using LSP
vim.cmd("command! Format execute 'lua vim.lsp.buf.formatting()'")

-- :Actions command to execute LSP's code_action() function
vim.cmd("command! Actions execute 'lua vim.lsp.buf.code_action()'")
