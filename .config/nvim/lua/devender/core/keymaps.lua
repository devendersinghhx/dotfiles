-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save File
keymap("n", "<leader>w", "<cmd> w <CR>", opts)

-- Save File (without auto-formatting)
keymap("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- Quit File
keymap("n", "<leader>q", "<cmd> q <CR>", opts)

-- Show Messages
keymap("n", "<leader>M", ":messages<cr>", { desc = "Show Messages" }, opts)

-- clear search highlights
keymap("n", "<ESC>", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- Move around in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Down In Visual" }, opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Up In Visual" }, opts)

-- Select all
keymap("n", "==", "gg<S-v>G")

-- Delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- Vertical scroll and center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>x", ":bd<CR>", opts) -- close buffer
keymap("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
keymap("n", "<leader>v", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
keymap("n", "<C-k>", ":wincmd k<CR>", opts)
keymap("n", "<C-j>", ":wincmd j<CR>", opts)
keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep last yanked when pasting
keymap("v", "p", '"_dP', opts)

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap("n", "<leader>id", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy Find", noremap = true, silent = true })
keymap(
	"n",
	"<leader>fw",
	":Telescope current_buffer_fuzzy_find<cr>",
	{ desc = "Fuzzy Find Pattern", noremap = true, silent = true }
)
keymap(
	"n",
	"<leader>fo",
	":Telescope oldfiles<cr>",
	{ desc = "Fuzzy Find Recent Files", noremap = true, silent = true }
)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = "Live Grep", noremap = true, silent = true })
keymap("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "String", noremap = true, silent = true })
keymap("n", "<leader>fr", ":Telescope resume<cr>", { desc = "Resume Search", noremap = true, silent = true })
keymap("n", "<leader>fk", ":Telescope keymaps<cr>", { desc = "Search Keymaps", noremap = true, silent = true })
keymap("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "Fuzzy Find Buffers", noremap = true, silent = true })
keymap("n", "<leader>sd", ":Telescope diagnostics<cr>", { desc = "Search Diagnostics" }, opts)
keymap("n", "<leader>sh", ":Telescope help_tags<cr>", { desc = "Search Help" }, opts)
keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" }, opts)

-----------------------------------------------------------------------------------------------------------------------------------------

-- Toggle Term
keymap("n", "<leader>tt", ":ToggleTerm<cr>", { desc = "Terminal Below", noremap = true, silent = true })
keymap(
	"n",
	"<leader>tf",
	":ToggleTerm direction=float<cr>",
	{ desc = "Terminal Floating", noremap = true, silent = true }
)

-- netrw
keymap("n", "<leader>pv", vim.cmd.Ex)

-- Oil.nvim
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- keymap("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Copy to Clipboard
--keymap("v", "<leader>y", '"+y', { desc = "Copy To Clipboard", noremap = true, silent = false })

-- Lazy Manager
keymap("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "Lazy Manager" }, opts)

-- Mason Manager
keymap("n", "<leader>M", "<CMD>Mason<CR>", { desc = "Mason Manager" }, opts)

-- LSP Info
keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
keymap("n", "<leader>e", ":silent NvimTreeFocus<CR>", { silent = true, noremap = true })

-- Nvim DAP
keymap("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
keymap("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
keymap("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
keymap("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
keymap("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
keymap(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
keymap("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
keymap("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
keymap("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
