-- config/lualine.lua

-- All sections here: https://github.com/nvim-lualine/lualine.nvim#available-components

require('lualine').setup {
  sections = {
    lualine_a = {
      {
        'filename',
        file_status = true,
        path = 1, -- show relative path
        shorting_target = 40,
        symbols = { modified = '[]', readonly = ' ' },
      },
    },
    lualine_b = {
      '" " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
    },
    lualine_c = {},
    lualine_x = {
      'branch',
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
      'diff',
      'fileformat',
      'filetype',
    },
    lualine_y = { 'progress', 'location' },
    lualine_z = { 'searchcount' },
  },
  inactive_sections = {
    lualine_a = {
      {
        'filename',
        symbols = { modified = '[]', readonly = ' ' },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'progress', 'location' },
    lualine_z = {},
  },
  options = {
    disabled_filetypes = {
      'packer',
      'NvimTree',
      'qf',
    },
  },
}
