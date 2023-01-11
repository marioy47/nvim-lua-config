-- lua/config/gitsigns.lua

require('gitsigns').setup {
  -- Better gutter feedback on some color schemes
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    changedelete = { text = '-' },
  },
  numhl = true,
  current_line_blame_opts = {
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
  },
  current_line_blame_formatter = '<author> • <author_time:%Y-%m-%d> • <summary>',

  -- Execute this only on the buffer
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Git reset hunk' })
    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Git reset hunk' })
    map('n', '<leader>hS', gs.stage_buffer, { desc = 'Git stage buffer' })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Git undo stage hunk' })
    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Git reset buffer' })
    map('n', '<leader>hp', gs.preview_hunk, { desc = 'Git preview hunk' })
    map('n', '<leader>hb', function()
      gs.blame_line { full = true }
    end, { desc = 'Git blame line' })
    map('n', '<leader>hd', gs.diffthis, { desc = 'Git diff this' })
    map('n', '<leader>hD', function()
      gs.diffthis '~'
    end, { desc = 'Git diff this ~' })
    map('n', '<leader>td', gs.toggle_deleted, { desc = 'Git toggle deleted' })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Git select hunk' })
  end,
}

-- Adding some commands for actions even though we have keymaps
vim.api.nvim_create_user_command('GitDeleted', "lua require('gitsigns').toggle_deleted()", {
  desc = 'Git toggle preview deleted lines (gitsigns)',
})
vim.api.nvim_create_user_command('GitBlame', "lua require('gitsigns').toggle_current_line_blame()", {
  desc = 'Git toggle line blame for current line (gitsigns)',
})
