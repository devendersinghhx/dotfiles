local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local opt = vim.opt -- for conciseness

-- Sync Clipboard between OS & Neovim
opt.clipboard:append("unnamedplus")

-- Appearance
opt.termguicolors = true -- enable 24-bit RGB colors

-- Files & Others
opt.fileencoding = "utf-8" -- the encoding written to file

-- line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = true -- show relative line numbers

-- Disable line wrapping
opt.wrap = false

-- Disable the default mode display (e.g., "-- INSERT --") since a statusline plugin will show it
opt.showmode = false

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.softtabstop = 4
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true -- Enable Smart indentation
opt.breakindent = true -- Enable break indent

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Show line under cursor
opt.cursorline = false

-- stores undos between sessions
opt.undofile = true

-- Scroll Off
opt.scrolloff = 15

-- Enable Mouse Mode (for resizing splits)
opt.mouse = "a"

-- Centers screen on entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "norm zz" })

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, { command = "silent! lua vim.highlight.on_yank()" })

vim.g.netrw_banner = 0
vim.o.fillchars = "eob: "

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python3_host_prog = "~/.venv/neovim/bin/python"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Show invisible characters
-- vim.opt.list = true
-- Customize how invisible characters appear
-- vim.opt.listchars = {
-- 	tab = "→ ", -- Show tab as → followed by space
-- 	trail = "·", -- Show trailing space as ·
-- 	nbsp = "␣", -- Show non-breaking space as ␣
-- 	eol = "↴", -- Show end-of-line as ↴
-- 	extends = "⟩", -- Show line overflow to the right
-- 	precedes = "⟨", -- Show line overflow to the left
-- }
--
-- Fill characters (UI elements)
-- vim.opt.fillchars = {
-- 	eob = " ", -- No ~ at end of buffer
-- 	fold = "─", -- Fold lines use light dash
-- 	vert = "│", -- Vertical split separator
-- 	diff = "╱", -- Diff filler lines
-- 	msgsep = "‾", -- Separator between messages
-- }
