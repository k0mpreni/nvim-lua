local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

vim.keymap.set("n", "<leader>vr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>vi", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>vs", builtin.lsp_document_symbols, {})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
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
        ["<C-p>"] = action_layout.toggle_preview,
      },
      i = {
        -- ["<C-u>"] = false,
        ["<C-p>"] = action_layout.toggle_preview,
      },
    },
    live_grep = {
      layout_config = {
        width = 0.95,
      },
    },
  },
  -- extensions = {
  --   fzf = {
  --     fuzzy = true,                   -- false will only do exact matching
  --     override_generic_sorter = true, -- override the generic sorter
  --     override_file_sorter = true,    -- override the file sorter
  --     case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
  --     -- the default case_mode is "smart_case"
  --   }
  -- },
  pickers = {
    find_files = {
      find_command = {
        "fd",
        "--type", "f",
        "--strip-cwd-prefix",
        "--hidden",
        "--exclude", ".git",
      },
      file_ignore_patterns = { "node_modules", ".git", ".venv" },
      no_ignore = true,
      hidden = true,
      layout_config = {
        width = 0.95,
      },
    },
    -- find_files = {
    --   file_ignore_patterns = { "node_modules", ".git", ".venv" },
    --   no_ignore = true,
    --   hidden = true,
    --   layout_config = {
    --     width = 0.95,
    --   },
    -- },
  },
})
telescope.load_extension('fzf')
