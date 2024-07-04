local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		go = { "golines", "goimports", "gofumpt" },
		css = { "prettierd", "rustywind" },
		html = { "prettierd", "rustywind" },
		json = { "prettierd" },
		jsonc = { "prettier" },
		scss = { "prettierd" },
		typescript = { "eslint", "prettierd" },
		vue = { "eslint", "prettierd" },
		markdown = { "prettierd", "markdownlint" },
		templ = { "templ" },
		sql = { "sql_formatter" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

conform.format({ lsp_fallback = true, async = true })
