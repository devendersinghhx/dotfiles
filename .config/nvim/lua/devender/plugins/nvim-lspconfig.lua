return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local lspui = require("lspconfig.ui.windows")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- NOTE: check it later
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		}
		----------------------------

		vim.api.nvim_create_autocmd("lspattach", {
			group = vim.api.nvim_create_augroup("userlspconfig", {}),
			callback = require("devender/core/lsp"),
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		lspui.default_options.border = "double"

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
			settings = {},
			single_file_support = true,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "css", "scss", "less" },
			init_options = {
				configurationSection = { "css", "scss", "less" },
				provideFormatter = true,
			},
			settings = {},
			single_file_support = true,
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
		})

		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"svelte",
				"pug",
				"typescriptreact",
				"vue",
			},
			init_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					},
				},
			},
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		--   	lspconfig.rust_analyzer.setup({
		-- 	capabilities = capabilities,
		-- })
	end,
}
