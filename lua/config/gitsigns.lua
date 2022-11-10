-- lua/config/gitsigns.lua

local gs = require("gitsigns")

local map = function(mode, l, r, buf, desc)
    local opts = { noremap = true, silent = true, buffer = buf, desc = desc }
    vim.keymap.set(mode, l, r, opts)
end

local on_attach = function(buf)
    map("n", "<Leader>gh", gs.preview_hunk, buf, "Preview hunk popup")
    map("n", "<Leader>gb", gs.blame_line, buf, "Git blame for the line")
    map("n", "<Leader>gd", gs.blame_line, buf, "Git diff current buffer")
end

gs.setup({
    on_attach = on_attach,
    numhl = true,
    current_line_blame_opts = {
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
    },
    current_line_blame_formatter = "<author> • <author_time:%Y-%m-%d> • <summary>",
})

vim.api.nvim_create_user_command("ToggleDeleted", "lua require('gitsigns').toggle_deleted()", {
    desc = "Git toggle preview deleted lines (gitsigns)",
})
vim.api.nvim_create_user_command("ToggleBlame", "lua require('gitsigns').toggle_current_line_blame()", {
    desc = "Git toggle line blame for current line (gitsigns)",
})
