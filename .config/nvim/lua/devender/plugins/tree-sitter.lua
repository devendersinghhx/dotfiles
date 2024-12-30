return {
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
				"c",
				"cpp",
				"cmake",
				"vim",
				"vimdoc",
				"query",
				"gitignore",
				"json",
				"jsonc",
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
			},
			ignore_install = {}, -- List parsers to ignore installation if any
			modules = {}, -- if you use custom modules, otherwise leave it empty
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				use_languagetree = true,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
