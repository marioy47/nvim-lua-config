-- lua/config/nvim-treesitter.lua

require("nvim-treesitter.configs").setup({
    -- To install additional languages, do: `:TSInstall <mylang>`. `:TSInstall maintained` to install all maintained
    ensure_installed = "maintained",
    sync_installed = true,
    highlight = {
        enable = true, -- This is a MUST
        additional_vim_regex_highlighting = { "php" },
    },
    indent = {
        enable = false, -- Really breaks stuff if true
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
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
})

-- Enable folds (zc and zo) on functions and classes but not by default
vim.cmd([[
  set nofoldenable
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])
