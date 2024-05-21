require("luasnip.loaders.from_vscode").lazy_load()

function OpenSnippetsFile()
	local filepath = "~/.config/nvim/snippets/" .. vim.bo.filetype .. ".lua"
	vim.api.nvim_command("edit" .. filepath)
end

vim.keymap.set("n", "<leader>os", ":lua OpenSnippetsFile()<cr>")
