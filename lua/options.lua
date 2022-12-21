-- lua/options.lua

vim.g.mapleader = ' ' -- Set <leader> to space
vim.g.maplocalleader = ' '
vim.opt.number = true -- Show numbers on the left
vim.opt.relativenumber = true -- Its better if you use motions like 10j or 5yk
vim.opt.hlsearch = true -- Highlight search results
vim.opt.ignorecase = true -- Search ignoring case
vim.opt.smartcase = true -- Do not ignore case if the search patter has uppercase
vim.opt.splitright = true -- New vert splits are on the right
vim.opt.splitbelow = true -- New horizontal splits, like `:help`, are on the bottom window
vim.opt.tabstop = 4 -- Tab size of 4 spaces
vim.opt.softtabstop = 4 -- On insert use 4 spaces for tab
vim.opt.smartindent = true -- Smart indent when starting a new line
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use appropriate number of spaces (no so good for PHP but we can fix this in ft)
vim.opt.wrap = false -- Wrapping sucks (except on markdown)
vim.opt.swapfile = false -- Do not leave any backup files
vim.opt.mouse = 'a' -- Enable mouse on all modes
vim.opt.showmatch = true -- Highlights the matching parenthesis
vim.opt.termguicolors = true -- Required for some themes
vim.opt.cursorline = true -- Highlight the current cursor line (Can slow the UI)
vim.opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text
vim.opt.hidden = true -- Allow multple buffers
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' } -- Let the user decide about the autocomplete
vim.opt.showmode = false -- Remove the  -- INSERT -- message at the bottom
vim.opt.updatetime = 750 -- I have a modern machine. No need to wait that long
vim.opt.shortmess:append 'c' -- Don't pass messages to |ins-completion-menu|.
vim.opt.encoding = 'utf-8' -- Just in case
vim.opt.inccommand = 'split' -- Shows the effects of a command incrementally AND in a preview window
vim.g.netrw_liststyle = 3 -- Use nested tree style NetRW
vim.g.netrw_winsize = 25 -- Lexplore takes 25% of the screen
vim.o.ch = 0 -- Requires Nvim 0.8: Hide command line at end unless a command is being executed
vim.opt.formatoptions:append { 'r' } -- Add asterisks in block comments (Not 100% sure)
vim.opt.spell = true -- Enable spelling on comments and docs
vim.opt.scrolloff = 1 -- Always put at least 1 line above or below the cursor (more context this way)
vim.opt.sidescrolloff = 2 -- When scrolling right, leave 2 chars to the right or left
vim.opt.confirm = true -- Ask for confirmation instead of error out when doing something like closing without saving
