return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		-- Define a reusable formatter set with stop_after_first
		local prettier_fmts = { "prettierd", "prettier", stop_after_first = true }

		return {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				rust = { "rustfmt", lsp_format = "fallback" },
				sh = { "shfmt" },
				cpp = { "clang-format" },

				-- Web-related filetypes
				html = prettier_fmts,
				css = prettier_fmts,
				json = prettier_fmts,
				javascript = prettier_fmts,
				typescript = prettier_fmts,
				javascriptreact = prettier_fmts,
				typescriptreact = prettier_fmts,
				markdown = prettier_fmts,
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2500,
			},
		}
	end,
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format current file",
		},
	},
}
