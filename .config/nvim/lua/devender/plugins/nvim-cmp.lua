return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter", -- Load when entering insert mode.
	dependencies = {
		{ "hrsh7th/cmp-buffer" }, -- Source for text within the current buffer (suggests words from the file you're editing).
		{ "hrsh7th/cmp-path" }, -- Source for file system paths (useful for path completions while typing).
		{ "hrsh7th/cmp-nvim-lsp" }, -- LSP-based autocompletion (fetches suggestions from language servers).
		{ "hrsh7th/cmp-nvim-lua" }, -- Autocomplete source for the Neovim's Lua API.
		{ "hrsh7th/cmp-cmdline" }, -- Command-line autocompletion (provides suggestions when typing commands in Neovim's command mode).
		{ "neovim/nvim-lspconfig" }, -- Quick configurations for Neovim's LSP client (enables language server functionality).
		{ "L3MON4D3/LuaSnip" }, -- Snippet engine for defining and expanding code snippets.
		{ "saadparwaiz1/cmp_luasnip" }, -- Allows LuaSnip snippets to integrate with nvim-cmp for autocompletion.
		{ "rafamadriz/friendly-snippets" }, -- Collection of ready-to-use snippets for various programming languages.
		{ "onsails/lspkind.nvim" }, -- Adds VSCode-like pictograms (icons) to the autocompletion menu for better visual representation.
		{ "petertriho/cmp-git", opts = {} }, -- Autocomplete source for Git.
		{ "roobert/tailwindcss-colorizer-cmp.nvim" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load() --loads vscode style snippets from installed plugins (e.g. friendly-snippets)

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "git" }, -- Git files.
				{ name = "tailwindcss-colorizer-cmp" },
			}),

			formatting = {
				format = lspkind.cmp_format({
					with_text = true,
					maxwidth = 50,
					before = require("tailwindcss-colorizer-cmp").formatter,
				}),
			},
		})
	end,
}
