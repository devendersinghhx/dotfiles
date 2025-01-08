return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,
	config = function()
		vim.o.termguicolors = true
		local colorizer = require("colorizer")

		colorizer.setup()
	end,
}
