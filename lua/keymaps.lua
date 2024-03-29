-- lua/keymaps.lua

-- Some shortcuts to make the conf file more clean
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }

--[[ Fixing some annoyances ]]

-- Just on <Space> should do nothing
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Show search matches at the top and unfold
vim.keymap.set('n', 'n', 'nztzv', opts)
vim.keymap.set('n', 'N', 'Nzv', opts)

-- Doble ESC to go to normal mode in :terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', opts)

-- Modify j and k when a line is wrapped. Jump to next VISUAL line
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", expr)
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", expr)

-- Reselect visual block after indent/outdent
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Do not move the cursor at the top after Yank text
vim.keymap.set('v', 'y', 'myy`y')

-- Pasting OVER selected (visual) text, does not replace the register text
vim.keymap.set('v', 'p', '"_dP')

--[[ Make it more powerful ]]

-- Add Up/Down scrolling (<C-e> and <C-y>) to insert mode (Dont use the mouse)
vim.keymap.set('i', '<C-y>', '<Esc><C-y>a', opts)
vim.keymap.set('i', '<C-e>', '<Esc><C-e>a', opts)

-- Move line up and down with J/K and keep the indentation
vim.keymap.set('x', 'J', ":move '>+1<CR>gv=gv", opts)
vim.keymap.set('x', 'K', ":move '<-2<CR>gv=gv", opts)

-- Resize windows with Shift+<arrow>
vim.keymap.set('n', '<S-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts)

-- Clear matches with Ctrl+l
vim.keymap.set('n', '<C-l>', ':noh<Cr>', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostics go to next' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostics go to prev' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostics open float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Add to the location window' })

-- [[ Buffers ]]
vim.keymap.set('n', '<Leader>bp', '<cmd>bprevious<cr>', {
  noremap = true,
  silent = true,
  desc = 'Go to next previous on buffer list (:bprevious)',
})
vim.keymap.set('n', '<Leader>bn', '<cmd>bnext<cr>', {
  noremap = true,
  silent = true,
  desc = 'Go to previous buffer on the list (:bnext)',
})

--s YY/XX Copy/Cut into the system clipboard
vim.cmd [[
noremap YY "+y<CR>
noremap XX "+x<CR>
]]
