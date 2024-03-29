local lsp = require("lsp-zero")
require("neodev").setup({})
require("neoconf").setup()
require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = { "volar", "tsserver" }
})
local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
    function(server_name)
        local server_config = {}
        if require("neoconf").get(server_name .. ".disable") then
            server_config = {
                autostart = false,
                root_dir = function()
                    return false
                end,
                single_file_support = false,
            }
            -- return
        end
        if server_name == "volar" then
            server_config.filetypes = { 'vue', 'typescript', 'javascript' }
        end
        lspconfig[server_name].setup(server_config)
    end,
})


lsp.preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- lsp.ensure_installed({
--     "volar",
--     "tsserver",
-- })


-- Fix Undefined global 'vim'
-- lsp.configure("luaformatter", {
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 		},
-- 	},
-- })
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-c>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- require("typescript").setup({
--     disable_commands = false, -- prevent the plugin from creating Vim commands
--     debug = false,            -- enable debug logging for commands
--     go_to_source_definition = {
--         fallback = true,      -- fall back to standard LSP definition on failure
--     },
--     server = {                -- pass options to lspconfig's setup method
--         commands = {
--             OrganizeImports = {
--                 organize_imports,
--                 description = "Organize Imports",
--             },
--         },
--         init_options = {
--             preferences = {
--                 importModuleSpecifierPreference = "non-relative",
--                 importModuleSpecifierEnding = "minimal",
--             },
--         },
--     },
-- })

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
