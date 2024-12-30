return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "neovim/nvim-lspconfig" },
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "double",
				width = 0.7,
				height = 0.7,
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"lua_ls",
				"pyright",
				"prettier",
				"prettierd",
				"rust-analyzer", -- Rust LSP
				"rustfmt", -- Rust Formatter
				"codelldb",
				"isort",
				"black",
				"bashls",
				"shfmt",
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 1000, -- 1 second delay
			--debounce_hours = 1, -- at least 5 hours between attempts to install/update
		})
	end,
}
