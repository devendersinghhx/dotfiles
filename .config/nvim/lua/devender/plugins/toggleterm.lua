return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 11,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminal = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal",
			autochdir = true,
			float_opts = {
				border = "rounded",
				width = 100,
				height = 20,
			},
		})
	end,
}
