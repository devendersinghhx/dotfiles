-- Helper function to reduce repetition
local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Save File
map("n", "<leader>w", "<cmd>w<CR>", "Save file")

-- Save File (without auto-formatting)
map("n", "<leader>sn", "<cmd>noautocmd w<CR>", "Save without auto-commands")

-- Quit File
map("n", "<leader>q", "<cmd>q<CR>", "Quit file")

-- Shortcut to auto-indent the entire file (like gg=G)
map("n", "<leader>i", "gg=G", "Auto-indent entire file")

map("n", "<leader>d", function()
	vim.diagnostic.open_float()
end, "Open Diagnostic in float")

-- clear search highlights
map("n", "<ESC>", "<cmd>nohl<CR>", "Clear search highlights")

-- Show Messages
map("n", "<leader>M", ":messages<cr>", "Show Messages")

-- Move around in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", "Down In Visual")
map("v", "K", ":m '<-2<CR>gv=gv", "Up In Visual")

-- Select all
map("n", "==", "gg<S-v>G", "Select All")

-- Delete single character without copying into register
map("n", "x", '"_x', "Delete Single Character without copying into register")

-- Toggle line wrapping
map("n", "<leader>lw", "<cmd>set wrap!<CR>", "Toggle Line Wrapping")

-- Toggle Term
map("n", "<leader>tt", ":ToggleTerm<cr>", "Terminal Below")
map("n", "<leader>tf", ":ToggleTerm direction=float<cr>", "Terminal Floating")

-- Lazy Manager
map("n", "<leader>L", "<CMD>Lazy<CR>", "Lazy Manager")

-- Mason Manager
map("n", "<leader>M", "<CMD>Mason<CR>", "Mason Manager")

-- Make Ctrl+Backspace delete the previous word in insert mode (like in shell editors)
-- Covers both <C-h> and <C-BS> to handle different terminal behaviors
map("i", "<C-h>", "<C-w>", "Delete previous word (Ctrl+Backspace)")
map("i", "<C-BS>", "<C-w>", "Delete previous word (Ctrl+Backspace)")
