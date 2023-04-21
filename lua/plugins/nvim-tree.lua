-- lua/config/nvim-tree.lua

require('nvim-tree').setup {
  -- Change sidebar position and size
  view = {
    adaptive_size = true,
    width = 45,
    side = 'right',
  },
  -- Make it prettier and have more git information
  renderer = {
    add_trailing = true, -- Display git status (staged, modified, etc) on files
    indent_markers = {
      enable = true,
    },
    special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'package.json', 'composer.json' },
    highlight_opened_files = 'all',
  },
  diagnostics = {
    enable = true, -- Show a warning on files with lint issues
    show_on_dirs = true,
  },
  git = {
    ignore = false, -- Do not hide .gitignore files
  },
  -- Change the default behaviour
  actions = {
    open_file = {
      quit_on_open = true, -- Auto close the sidebar when a file gets opened
      resize_window = true, -- Resize the sidebar when the windows resizes
      window_picker = {
        enable = false, -- Ask the user on which window to open when split are open
      },
    },
  },
}

-- Keymaps for faster access
local opts = { noremap = true, silent = true }
vim.keymap.set({ '', 'n' }, '<Leader>kk', '<cmd>NvimTreeToggle<cr>', opts)
vim.keymap.set({ '', 'n' }, '<Leader>kf', '<cmd>NvimTreeFindFile<cr>', opts)
