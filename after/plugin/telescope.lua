local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>vr", builtin.lsp_references, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fs", function()
	builtin.live_grep({ search = vim.fn.input("Grep Word> ") })
end)
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
telescope.setup({
	defaults = {
		path_display = { truncate = 3 },
		preview = {
			hide_on_startup = true,
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
	},
})
