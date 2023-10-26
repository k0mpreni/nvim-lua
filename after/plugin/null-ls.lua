local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			extra_filetypes = { "svelte" },
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports,
		-- null_ls.builtins.diagnostics.phpcs,
		-- null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.code_actions.eslint_d,
		-- null_ls.builtins.diagnostics.eslint_d.with({
		-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- format on save
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, async = async })
				end,
			})
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
})
