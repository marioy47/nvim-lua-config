-- options.lua

vim.opt.number = true           -- Show numbers on the left
vim.opt.relativenumber = true   -- Its better if you use motions like 10j or 5yk
vim.opt.hlsearch = true         -- Highlight search results
vim.opt.ignorecase = true       -- Search ignoring case
vim.opt.smartcase = true        -- Do not ignore case if the search patter has uppercase
vim.opt.splitright = true       -- New vert splits are on the right
vim.opt.splitbelow = true       -- New horizontal splits, like `:help`, are on the bottom window
vim.opt.tabstop = 4             -- Tab size of 4 spaces
vim.opt.softtabstop = 4         -- On insert use 4 spaces for tab
vim.opt.shiftwidth = 0
vim.opt.expandtab = true        -- Use appropriate number of spaces (no so good for PHP)
vim.opt.wrap = false            -- Wrapping sucks (except on markdown)
vim.opt.swapfile = false        -- Do not leave any backup files
vim.opt.mouse="i"               -- Enable mouse on insert mode
vim.opt.showmatch  = true       -- Highlights the matching parenthesis
vim.opt.termguicolors = true   -- Required for some themes
vim.opt.foldlevel = 1           -- Do not fold inside folds. Better for markdown and PHP classes
vim.opt.cursorline = true       -- Highlight the current cursor line (Can slow the UI)
vim.opt.signcolumn = "yes"      -- Always show the signcolumn, otherwise it would shift the text
vim.opt.hidden = true           -- Allow multple buffers
vim.opt.completeopt = { "menuone" , "noinsert" , "noselect" } -- Let the user decide about the autocomplete
vim.opt.showmode = false         -- Remove the --INSERT-- message at the bottom
vim.opt.updatetime = 750         -- I have a modern machine. No need to wait that long
vim.opt.shortmess:append("c")    -- Don't pass messages to |ins-completion-menu|.
vim.opt.encoding = "utf-8"       -- Just in case

