-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Editing Keymaps
keymap("n", "<leader>q", ":q<cr>", { desc = "Quit the current file", noremap = true, silent = true })
keymap("n", "<leader>Q", ":qa<cr>", { desc = "Force quit all files", noremap = true, silent = true })
keymap("n", "<leader>w", ":w<cr>", { desc = "Save the current file", noremap = true, silent = true })
keymap("n", "<leader>W", ":wa<cr>", { desc = "Save all open files", noremap = true, silent = true })
keymap("n", "<leader>M", ":messages<cr>", { desc = "Show message history", noremap = true, silent = true })

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- netrw
keymap("n", "<leader>pv", vim.cmd.Ex)

-- Copy to Clipboard
keymap("v", "<leader>y", '"+y', { desc = "Copy To Clipboard", noremap = true, silent = false })

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

--Tabs
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Move around in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Down In Visual", noremap = true, silent = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Up In Visual", noremap = true, silent = true })

-- Cursor stays in front while append
keymap("n", "J", "mzJ`z")

-- =========================
-- plugin specific keymaps
-- =========================

-- Lazy Manager
vim.api.nvim_set_keymap("n", "<leader>L", ":Lazy<CR>", { noremap = true, silent = true })

-- Toggle Term
keymap("n", "<leader>tt", ":ToggleTerm<cr>", { desc = "Terminal Below", noremap = true, silent = true })
keymap(
	"n",
	"<leader>tf",
	":ToggleTerm direction=float<cr>",
	{ desc = "Terminal Floating", noremap = true, silent = true }
)

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
keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- LSP Keymaps
keymap("n", "<leader>li", ":LspInfo<cr>", { desc = "Connected Language Servers", noremap = true, silent = true })
keymap(
	"n",
	"<leader>lK",
	":lua vim.lsp.buf.signature_help()<cr>",
	{ desc = "Signature Help", noremap = true, silent = true }
)
keymap(
	"n",
	"<leader>lD",
	":Telescope diagnostics<cr>",
	{ desc = "Telescope Diagnostic", noremap = true, silent = true }
)
keymap(
	"n",
	"<leader>lt",
	":Telescope lsp_type_definitions<cr>",
	{ desc = "Type Definition", noremap = true, silent = true }
)
keymap(
	"n",
	"<leader>ld",
	":Telescope lsp_definitions<cr>",
	{ desc = "Go To Definition", noremap = true, silent = true }
)
keymap("n", "<leader>lr", ":Telescope lsp_references<cr>", { desc = "References", noremap = true, silent = true })

-- LSP Keymaps
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover", noremap = true, silent = true })
keymap("n", "<space>ca", vim.lsp.buf.code_action, {})

-- Auto-Session Manager
keymap("n", "<leader>ss", ":SessionSave<CR>", { desc = "Session Save", noremap = true, silent = true })
keymap("n", "<leader>sr", ":SessionRestore<CR>", { desc = "Session Restore", noremap = true, silent = true })
keymap("n", "<leader>sd", ":SessionDelete<CR>", { desc = "Session Delete", noremap = true, silent = true })
