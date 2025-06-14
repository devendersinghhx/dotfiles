return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true, -- also enable telescope ui below
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }, --Useful for getting pretty icons, but requires a Nerd Font
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "folke/todo-comments.nvim" }, -- for to-do comments to show in telescope
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy Find Files" },
			{ "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find in Current Buffer" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy Find Recent Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Search for Word Under Cursor" },
			{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume Last Search" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Fuzzy Find Buffers" },
			-- { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search Diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help Tags" },
			-- { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODO Comments" },
		},

		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							width = 0.9,
							height = 0.9,
							prompt_position = "bottom",
							preview_cutoff = 120,
							preview_width = 75,
							horizontal = { mirror = false },
							vertical = { mirror = false },
						},
					},
					find_command = {
						"rg",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "  ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = {},
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = {},
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					pickers = {
						find_files = {
							file_ignore_patterns = { "node_modules", ".git", ".venv" },
							hidden = true,
						},
					},
					live_grep = {
						file_ignore_patterns = { "node_modules", ".git", ".venv" },
						additional_args = function(_)
							return { "--hidden" }
						end,
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default + actions.center,
						},
						n = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<esc>"] = actions.close,
						},
					},
				},
			})

			telescope.load_extension("fzf")
		end,
	},

	-- telescope ui select extensions
	{
		"nvim-telescope/telescope-ui-select.nvim",
		-- enabled = false,
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
