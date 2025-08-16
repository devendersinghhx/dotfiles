return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash",
					"lua",
					"python",
					"regex",
					"latex",
					"c",
					"cpp",
					"rust",
					"cmake",
					"gitignore",
					"markdown",
					"json",
					"jsonc",
					"html",
					"css",
					"scss",
					"javascript",
					"typescript",
					"vimdoc",
				},
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Enter>", -- set to `false` to disable one of the mappings
						node_incremental = "<Enter.",
						scope_incremental = false,
						node_decremental = "<Backspace>",
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
}
