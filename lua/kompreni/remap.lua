vim.opt.pastetoggle = "<F2>"

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<C>w", "<cmd>:w<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+P]])
-- vim.keymap.set("n", "<leader>R", [["+R]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", "<nop>")

vim.keymap.set("n", "<leader>vh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>vp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>vn", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>gs", "<cmd>:tab G<CR>")
vim.keymap.set("n", "<leader>wd", "<cmd>:vs<CR>")
vim.keymap.set("n", "<leader>sh", "<cmd>:sp<CR>")

vim.keymap.set("n", "gr", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gu", "<cmd>diffget //3<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>t", "<cmd>:ToggleTerm<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>:bd<CR>")
