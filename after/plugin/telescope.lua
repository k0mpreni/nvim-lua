local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>vr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>vi", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>vs", builtin.lsp_document_symbols, {})

vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fs", function()
	builtin.live_grep({ search = vim.fn.input("Grep Word> ") })
end)
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
telescope.setup({
	defaults = {
		-- vimgrep_arguments = { -- :h telescope.defaults.vimgrep_arguments for more info
		-- 	"rg",
		-- 	"--hidden",
		-- 	"--glob", -- this flag allows you to hide exclude these files and folders from your search 👇
		-- 	"!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock}",
		-- },
		path_display = { truncate = 3 },
		preview = {
			hide_on_startup = true,
		},
		layout_config = {
			preview_width = 0.75,
			horizontal = { height = 0.9, width = 0.9 },
		},
		mappings = {
			n = {
				["<M-p>"] = action_layout.toggle_preview,
			},
			i = {
				["<C-u>"] = false,
				["<M-p>"] = action_layout.toggle_preview,
			},
		},
		live_grep = {
			layout_config = {
				width = 0.95,
			},
		},
	},
	pickers = {
		find_files = {
			file_ignore_patterns = { "node_modules", ".git", ".venv" },
			no_ignore = true,
			hidden = true,
			layout_config = {
				width = 0.95,
			},
		},
	},
})
