-- ==========================================================================
-- LEADER KEY
-- ==========================================================================
-- Set leader key to backslash (Vim's default)
-- Must be set before loading plugins!
vim.g.mapleader = "\\"

-- ==========================================================================
-- PLUGIN MANAGER (lazy.nvim)
-- ==========================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure Airline variables BEFORE loading the plugin
vim.g.airline_powerline_fonts = 1
vim.g.airline_extensions = {'tabline'}
-- In Lua, variables with '#' must be set using bracket syntax
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'

-- Load Plugins
require("lazy").setup({
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "npbarnes/bufpos",
  "LnL7/vim-nix",
})

-- ==========================================================================
-- OPTIONS (Replaces `set ...`)
-- ==========================================================================
-- Note: 'nocompatible', 'syntax on', and 'filetype plugin indent on'
-- are native Neovim defaults, so we don't need to specify them anymore.

local opt = vim.opt

opt.clipboard = "unnamedplus" -- Use system clipboard
opt.expandtab = true        -- Spaces are better than tabs
opt.smarttab = true
opt.tabstop = 4             -- Tabstops are 4 spaces by default
opt.shiftwidth = 4
opt.wrapscan = true         -- Wrap lines when top/bottom of search is reached
opt.ignorecase = true       -- Ignore case for lowercase searches
opt.smartcase = true        -- Recognize uppercase if specified
opt.hidden = true           -- Turn on hidden buffers
opt.wildmenu = true         -- Enhanced command-line completion
opt.incsearch = true        -- Incrementally match the search
opt.showcmd = true          -- Show current command in lower right corner
opt.showmode = false        -- Turn off mode display (Airline handles this)
opt.scrolloff = 2           -- Keep cursor 2 lines from top/bottom
opt.number = true           -- Enable line numbering
opt.spelllang = 'en'        -- Use English for spell checking
opt.spell = false           -- Don't spell check by default
opt.foldmethod = 'syntax'   -- Folding stuffs
opt.foldnestmax = 1
opt.foldlevelstart = 99
opt.errorbells = false      -- No error bells
opt.hlsearch = false        -- Turn off highlight search

-- ==========================================================================
-- KEYMAPS (Replaces `map`, `nmap`, `nnoremap`, etc.)
-- ==========================================================================
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Easy edit for init.lua (replacing $MYVIMRC)
keymap('n', '<leader>ev', ':e $MYVIMRC<cr>', default_opts)

-- Move cursor by screen lines, not hard lines
keymap({'n', 'v'}, 'j', 'gj', default_opts)
keymap({'n', 'v'}, 'k', 'gk', default_opts)
keymap({'n', 'v'}, '<Down>', 'gj', default_opts)
keymap({'n', 'v'}, '<Up>', 'gk', default_opts)
keymap('i', '<Down>', '<C-o>gj', default_opts)
keymap('i', '<Up>', '<C-o>gk', default_opts)

-- Move around split windows
keymap('n', '<c-k>', ':wincmd k<CR>', default_opts)
keymap('n', '<c-j>', ':wincmd j<CR>', default_opts)
keymap('n', '<c-h>', ':wincmd h<CR>', default_opts)
keymap('n', '<c-l>', ':wincmd l<CR>', default_opts)

-- When searching, center on the line that is found
keymap('n', 'N', 'Nzz', default_opts)
keymap('n', 'n', 'nzz', default_opts)

-- Folding toggle
keymap('n', '<space>', 'za', default_opts)

-- Bufpos shortcuts
keymap('n', '<Leader>l', ':ls<CR>', default_opts)
keymap('n', '<Leader>b', ':bp<CR>', default_opts)
keymap('n', '<Leader>f', ':bn<CR>', default_opts)
keymap('n', '<Leader>g', ':e#<CR>', default_opts)
keymap('n', '<Leader>z', ':bd<CR>', default_opts)

-- We can use a Lua loop to generate the 1-9 BufPos bindings automatically!
for i = 1, 9 do
  keymap('n', '<Leader>' .. i, ':call BufPos_ActivateBuffer(' .. i .. ')<CR>', default_opts)
end
keymap('n', '<Leader>0', ':call BufPos_ActivateBuffer(10)<CR>', default_opts)

-- Automatically send mouse selections to the Primary Selection (Linux middle mouse button clipboard)
keymap('v', '<LeftRelease>', '"*ygv', { noremap = true, silent = true })

-- Shortcut to send visual mode to the Primary Selection (Linux middle mouse button clipboard)
keymap('v', '<CR>', '"*y', { noremap = true, silent = true})

-- ==========================================================================
-- AUTOCOMMANDS
-- ==========================================================================
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Remove any trailing whitespace that is in the file on save
autocmd({"BufRead", "BufWrite"}, {
  group = augroup,
  pattern = "*",
  callback = function()
    if not vim.opt.binary:get() then
      vim.cmd("silent! %s/\\s\\+$//ge")
    end
  end,
})

-- Keep cursor at the top for git commits
autocmd("BufEnter", {
  group = augroup,
  pattern = "COMMIT_EDITMSG",
  callback = function()
    local ok, result = pcall(vim.api.nvim_win_set_cursor, 0, {1, 0})
    if not ok then
      vim.notify("Failed to set win cursor to the top (commit message): " .. tostring(result), vim.log.levels.ERROR)
    end
  end,
})
