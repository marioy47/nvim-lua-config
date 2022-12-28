-- lua/config/material.lua

-- Availabe themes
-- - darker
-- - lighter
-- - oceanic
-- - palenight
-- - deep ooceancean
vim.g.material_style = 'darker'

require('material').setup {
  contrast = {
    terminal = true, -- Enable contrast for the built-in terminal
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },
  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    'dap',
    'dashboard',
    'gitsigns',
    -- "hop",
    'indent-blankline',
    'lspsaga',
    -- "mini",
    -- "neogit",
    'nvim-cmp',
    -- "nvim-navic",
    'nvim-tree',
    'nvim-web-devicons',
    -- "sneak",
    'telescope',
    -- "trouble",
    'which-key',
  },
}
