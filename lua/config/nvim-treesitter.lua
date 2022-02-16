    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua',
        'php',
        'python',
        'typescript',
      },
      sync_installed = true,
      highlight = {
        enable = true,
      }
    })
