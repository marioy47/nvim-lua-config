-- lua/config/nvim-treesitter.lua

require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = {
        enable = true, -- This is a MUST
        additional_vim_regex_highlighting = false, -- {"php"}
    },
    incremental_selection = {
        enable = true, -- Enable selection of CODE blocks
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
})

-- Enable folds (zc and zo) on functions and classes but not by default
vim.cmd([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set nofoldenable
]])
