-- config/telescope.lua

-- Telescope window configuration
require('telescope').setup {
  defaults = {
    sorting_strategy = 'ascending',
    --     layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
      },
      width = 0.9,
      height = 0.9,
    },
  },
}

-- Telescope Keymaps
vim.keymap.set('n', '<Leader>bb', '<cmd>Telescope buffers<cr>', {})
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', {})
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', {})
vim.keymap.set('n', '<Leader>fr', '<cmd>Telescope registers<cr>', {})
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', {})
vim.keymap.set(
  'n',
  '<Leader>fo',
  "<cmd>lua require('telescope.builtin').lsp_document_symbols({symbols = {'class', 'property', 'method', 'constructor'}})<cr>",
  { desc = 'Show emoticons and other symbols' }
)

-- Telescope commands
vim.api.nvim_create_user_command('GitStatus', 'Telescope git_status', { desc = 'Show status of files' })

-- RipGrep extension (Usage: https://github.com/nvim-telescope/telescope-live-grep-args.nvim#usage)
require('telescope').load_extension 'live_grep_args'
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- UI Select
require('telescope').load_extension 'ui-select'
