-- config/telescope.lua
-- Based on "kickstart.nvim"

-- Telescope window configuration
require('telescope').setup {
  defaults = {
    mappings = { -- Documentation ask's for you to set them up
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    sorting_strategy = 'ascending',
    -- layout_strategy = " -- Dihorizontal",
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

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Telescope commands
vim.api.nvim_create_user_command('GitStatus', 'Telescope git_status', { desc = 'Show status of files' })
