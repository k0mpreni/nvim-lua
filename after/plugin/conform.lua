require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "eslint_d", { "prettierd", "prettier" } },
		go = { "golines", "goimports", "gofumpt" },
		css = { "prettierd", "rustywind" },
		html = { "prettierd", "rustywind" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		scss = { "prettierd" },
		typescript = { "eslint_d", "prettierd" },
		vue = { "eslint_d" },
		markdown = { "prettierd", "markdownlint" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
