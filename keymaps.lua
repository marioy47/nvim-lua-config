-- keymaps.lua
--
function set_keymap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  set_keymap("n", shortcut, command)
end

function imap(shortcut, command)
  set_keymap("i", shortcut, command)
end

function vmap(shortcut, command)
  set_keymap("v", shortcut, command)
end

function cmap(shortcut, command)
  set_keymap("c", shortcut, command)
end

function tmap(shortcut, command)
  set_keymap("t", shortcut, command)
end

function xmap(shortcut, command)
  set_keymap("x", shortcut, command)
end

set_keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Don't jump when using *
nmap('*', '*<c-o>')

-- Keep search matches in the middle of the window
nmap('n', 'nzzzv') -- Search matches in the middle of the screen
nmap('N', 'Nzzzv') -- Search matches in the middle of the screen

-- NetRW (Lexplore Sexplore)
nmap( "<leader>ex", ":Lex 30<cr>")

-- Clear matches
nmap("<C-l>", ":noh<CR>")


-- Reselect visual block after indent/outdent
vmap('<', '<gv')
vmap('>', '>gv')

-- ESC to go to normal mode in terminal
tmap('<C-s>', '<C-\\><C-n>')
tmap('<Esc><Esc>', '<C-\\><C-n>')

-- Resize with arrows
nmap( "<S-k>", ":resize +2<CR>")
nmap( "<S-j>", ":resize -2<CR>")
nmap( "<S-l>", ":vertical resize -2<CR>")
nmap( "<S-h>", ":vertical resize +2<CR>")

-- Navigate buffers
nmap( "<S-Tab>", ":bnext<CR>", opts)
nmap( "<leader>bu", ":buffers<CR>", opts)

-- Move text up and down
xmap( "J", ":move '>+1<CR>gv-gv", opts)
xmap( "K", ":move '<-2<CR>gv-gv", opts)
--xmap( "<A-j>", ":move '>+1<CR>gv-gv", opts)
--xmap( "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- vim: ts=2 sw=2 et
