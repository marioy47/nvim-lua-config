-- lua/keymaps.lua

-- Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   term_mode         = "t",
--   command_mode      = "c",

-- Some shortcuts to make the conf file more clean
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }

-- Add Up/Down scrolling (<C-e> and <C-y>) to insert mode
vim.keymap.set("i", "<C-y>", "<Esc><C-y>a", opts)
vim.keymap.set("i", "<C-e>", "<Esc><C-e>a", opts)

-- Show search matches at the top and unfold
vim.keymap.set("n", "n", "nztzv", opts)
vim.keymap.set("n", "N", "Nzv", opts)

-- Clear matches with Ctrl+l
vim.keymap.set("n", "<C-l>", ":noh<Cr>", opts)

-- Reselect visual block after indent/outdent
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<Leader>bp", "<cmd>bprevious<cr>", {
    noremap = true,
    silent = true,
    desc = "Go to next previous on buffer list (:bprevious)",
})
vim.keymap.set("n", "<Leader>bn", "<cmd>bnext<cr>", {
    noremap = true,
    silent = true,
    desc = "Go to previous buffer on the list (:bnext)",
})

--s YY/XX Copy/Cut into the system clipboard
vim.cmd([[
noremap YY "+y<CR>
noremap XX "+x<CR>
]])

-- Doble ESC to go to normal mode in terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Resize windows with Shift+<arrow>
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Move line up and down with J/K
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Modify j and k when a line is wrapped. Jump to next VISUAL line
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", expr)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", expr)

--[[Telescope

vim.keymap.set({ "", "i" }, "<C-k><C-p>", "<cmd>lua require(\"telescope.builtin\").find_files()<cr>", opts)
vim.keymap.set({ "", "i" }, "<C-k><C-o>", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<Leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<Leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<Leader>e", require("telescope.builtin").diagnostics, {})
vim.keymap.set("n", "<Leader>fs", require("telescope.builtin").lsp_document_symbols, {})
vim.keymap.set("n", "<Leader>gs", require("telescope.builtin").git_status, {})
vim.keymap.set("n", "<Leader>gb", require("telescope.builtin").git_branches, {})

--]]
