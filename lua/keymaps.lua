-- lua/keymaps.lua

-- Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   term_mode         = "t",
--   command_mode      = "c",

-- Some shortcuts to make the conf file more clean
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }

-- Jump back and scroll to top when using *
--map("n", "*", "*zt<C-y><C-y>", opts)

-- Add Up/Down scrolling (<C-e> and <C-y>) to insert mode
map("i", "<C-y>", "<Esc><C-y>a", opts)
map("i", "<C-e>", "<Esc><C-e>a", opts)

-- Show search matches at the top and unfold
map("n", "n", "nztzv", opts)
map("n", "N", "Nzv", opts)

-- Clear matches with Ctrl+l
map("n", "<C-l>", ":noh<Cr>", opts)

-- Reselect visual block after indent/outdent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Switch buffers
map("n", "<space>bn", "<cmd>bnext<cr>", opts)
map("n", "<space>bp", "<cmd>bprevious<cr>", opts)
map("n", "<space>bb", "<cmd>buffers<cr>", opts)

--s YY/XX Copy/Cut into the system clipboard
vim.cmd([[
noremap YY "+y<CR>
noremap XX "+x<CR>
]])

-- Doble ESC to go to normal mode in terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Resize windows with Shift+<arrow>
map("n", "<S-Up>", ":resize +2<CR>", opts)
map("n", "<S-Down>", ":resize -2<CR>", opts)
map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Move line up and down with J/K
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Modify j and k when a line is wrapped. Jump to next VISUAL line
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr)

-- Telescope
map({ "", "i" }, "<C-k><C-p>", "<cmd>lua require(\"telescope.builtin\").find_files()<cr>", opts)
map({ "", "i" }, "<C-k><C-l>", "<cmd>lua require(\"telescope.builtin\").buffers()<cr>", opts)
map({ "", "i" }, "<C-k><C-o>", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)

map("n", "<space>ff", require('telescope.builtin').find_files, {})
map("n", "<space>fg", require('telescope.builtin').live_grep, {})
map("n", "<space>fb", require('telescope.builtin').buffers, {})
map("n", "<space>fh", require('telescope.builtin').help_tags, {})
map("n", "<space>fs", require('telescope.builtin').lsp_document_symbols, {})
map("n", "<space>gs", require('telescope.builtin').git_status, {})
map("n", "<space>gb", require('telescope.builtin').git_branches, {})

-- Nvim-Tree
map({ "", "n" }, "<C-k><C-k>", "<cmd>NvimTreeToggle<cr>", opts)
