-- lua/config/nvim-tree.lua

require('nvim-tree').setup {
  open_on_setup = true,
  view = { -- Make it wider and to the right
    adaptive_size = true,
    width = 45,
    side = 'right',
    mappings = {
      list = {
        { key = '<C-k>', action = '' }, -- Avoid conflicts with other plugins
        { key = 'i', action = 'toggle_file_info' }, -- Friendlier with Spanish Keyboards
      },
    },
  },
  renderer = { -- Show file git status and markers for indentation
    add_trailing = true,
    indent_markers = {
      enable = true,
    },
    special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'package.json', 'composer.json' },
    highlight_opened_files = 'all',
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = { -- Do not hide .gitignore files
    ignore = false,
  },
  actions = { -- Autoclose and auto-rezise
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = false,
      },
    },
  },
}

-- Keymaps for faster access
local opts = { noremap = true, silent = true }
vim.keymap.set({ '', 'n' }, '<Leader>kk', '<cmd>NvimTreeToggle<cr>', opts)
vim.keymap.set({ '', 'n' }, '<Leader>kf', '<cmd>NvimTreeFindFile<cr>', opts)
