-- lua/options.lua

vim.g.mapleader = ' ' -- Set <leader> to space
vim.g.maplocalleader = ' '
vim.opt.number = true -- Show numbers on the left
vim.opt.relativenumber = true -- Its better for motions usage like 10j or 5yk
vim.opt.hlsearch = true -- Highlight search results
vim.opt.ignorecase = true -- Search ignoring case
vim.opt.smartcase = true -- Do not ignore case if the search pattern has at least one uppercase
vim.opt.splitright = true -- New vertical splits are on the right
vim.opt.splitbelow = true -- New horizontal splits, like `:help`, are on the bottom window
vim.opt.wrap = false -- Wrapping sucks (except on markdown)
vim.opt.swapfile = false -- Do not leave any backup files
vim.opt.mouse = 'a' -- Enable mouse on all modes. In normal mode is useful for scrolling
vim.opt.showmatch = true -- Highlights the matching parenthesis
vim.opt.termguicolors = true -- Required for some themes
vim.opt.cursorline = true -- Highlight the current cursor line (Can slow the UI on old computers)
vim.opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text
vim.opt.hidden = true -- Allow multiple buffers
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' } -- Let the user decide about the autocomplete
vim.opt.showmode = false -- Remove the  -- INSERT -- message at the bottom. The cursor change will tell us we're inserting
vim.opt.updatetime = 550 -- I have a modern machine. No need to wait that long
vim.opt.shortmess:append 'c' -- Don't pass messages to |ins-completion-menu|.
vim.opt.encoding = 'utf-8' -- Just in case
vim.opt.inccommand = 'split' -- Shows the effects of a command incrementally AND in a preview window
vim.g.netrw_liststyle = 3 -- Use nested tree style NetRW
vim.g.netrw_winsize = 25 -- Lexplore takes 25% of the screen
vim.g.netrw_altv = 'nospr'
vim.o.ch = 0 -- Requires Nvim 0.8: Hide command line at end unless a command is being executed
vim.opt.tabstop = 4
vim.opt.scrolloff = 1 -- Always put at least 1 line above or below the cursor (more context this way)
vim.opt.sidescrolloff = 2 -- When scrolling right, leave 2 chars to the right or left
vim.opt.confirm = true -- Ask for confirmation instead of error out when doing something like closing without saving
