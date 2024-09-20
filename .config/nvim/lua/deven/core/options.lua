local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')``
local opt = vim.opt -- for conciseness

cmd("let g:netrw_liststyle = 3")
cmd("filetype plugin indent on")
cmd([[highlight WinSeparator guibg = None]])

-- Appearance
opt.termguicolors = true -- enable 24-bit RGB colors

-- Files & Others
opt.fileencoding = "utf-8" -- the encoding written to file

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.softtabstop = 4
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true -- Enable Smart indentation

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Scroll Off
opt.scrolloff = 15

-- Line numbers etc in Netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

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
