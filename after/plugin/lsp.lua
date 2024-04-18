require("neodev").setup({})
require("neoconf").setup()
require("mason").setup()

local lsp = require("lsp-zero")
local home = os.getenv("HOME")
local lspconfig = require("lspconfig")

require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'volar'}
})
local tsdk = require('mason-registry').get_package('typescript-language-server'):get_install_path() ..
                 '/node_modules/typescript/lib'
local vuePlugin = home .. '/node_modules/@vue/typescript_plugin'

lspconfig.volar.setup({})
lspconfig.tsserver.setup({
    init_options = {
        plugins = {{
            name = "@vue/typescript-plugin",
            location = vuePlugin,
            languages = {"javascript", "typescript", "vue"}
        }},
        tsserver = {
            -- This overwrite the path from the local project, in case your project ts version is not compatible with the plugin
            path = tsdk
        }
    },
    filetypes = {'javascript', 'typescript', 'vue'}
})

lsp.preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true
})

local cmp = require("cmp")
local cmp_select = {
    behavior = cmp.SelectBehavior.Select
}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({
        select = true
    }),
    ["<C-c>"] = cmp.mapping.complete()
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {
        buffer = bufnr,
        remap = false
    }

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

require'lspconfig'.eslint.setup {}

lsp.setup();

vim.diagnostic.config({
    virtual_text = true
})
