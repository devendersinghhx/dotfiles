return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			on_highlights = function(hl, palette)
				hl.DiagnosticError = { fg = palette.none, bg = palette.none, sp = palette.red }
				hl.DiagnosticWarn = { fg = palette.none, bg = palette.none, sp = palette.yellow }
				hl.DiagnosticInfo = { fg = palette.none, bg = palette.none, sp = palette.blue }
				hl.DiagnosticHint = { fg = palette.none, bg = palette.none, sp = palette.green }
			end,
		})
		vim.cmd([[colorscheme everforest]])
		vim.g.everforest_background = "hard"
		vim.g.everforest_better_performance = 1
	end,
}
