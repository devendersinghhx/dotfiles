return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Load and setup mini.statusline
		-- require("mini.statusline").setup({
		-- 	options = {
		-- 		theme = "everforest",
		-- 	},
		-- })
		-- Optional: make statusline global
		vim.o.laststatus = 3

		-- MINI PAIRS
		require("mini.pairs").setup()
	end,
}
