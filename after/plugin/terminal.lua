-- ToggleTerm & Lazygit setup

local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit (centered floating terminal)
-- local lazygit = Terminal:new({
--   cmd = "lazygit",
--   hidden = true,
--   direction = "float",
--   float_opts = {
--     border = "rounded",
--     width = math.floor(vim.o.columns * 0.9),
--     height = math.floor(vim.o.lines * 0.9),
--   },
-- })
--
-- function _lazygit_toggle()
--   lazygit:toggle()
-- end
--
-- vim.keymap.set("n", "<leader>g", _lazygit_toggle, {
--   desc = "Lazygit",
--   silent = true,
-- })

-- ToggleTerm setup
require("toggleterm").setup({
  direction = "float",
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  close_on_exit = true,
  rounded = true,
})

-- Toggle terminal
vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>exe v:count1 .. 'ToggleTerm'<cr>", {
  desc = "Toggle terminal",
  silent = true,
})

-- Close terminal with Esc
vim.keymap.set("t", "<Esc>", function()
  vim.cmd("stopinsert")
  vim.cmd("ToggleTerm")
end, {
  desc = "Close terminal",
  silent = true,
})

-- Window navigation (works from terminal & normal mode)
vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>wincmd h<cr>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>wincmd j<cr>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>wincmd k<cr>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>wincmd l<cr>", { silent = true })
