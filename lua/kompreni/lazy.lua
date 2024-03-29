return require("lazy").setup({
	"pixelastic/vim-undodir-tree",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
	{ "ellisonleao/gruvbox.nvim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
			"windwp/nvim-autopairs",
		},
	},
	-- "ggandor/leap.nvim",
	"nvim-treesitter/playground",
	{
		"lukas-reineke/lsp-format.nvim",
		config = function()
			require("lsp-format").setup({})
			-- require("lspconfig").gopls.setup({ on_attach = require("lsp-format").on_attach })
			-- require("lspconfig").gopls.setup({ on_attach = require("lsp-format").on_attach })
		end,
	},
	"theprimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"lewis6991/gitsigns.nvim",

    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Configuration & Plugins
            "neovim/nvim-lspconfig",
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            "j-hui/fidget.nvim",

            -- Additional lua configuration, makes nvim stuff amazing
            "folke/neodev.nvim",
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },

            -- Other
            "jose-elias-alvarez/null-ls.nvim",
            "jose-elias-alvarez/typescript.nvim",
        },
    },
    "posva/vim-vue",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = { theme = "gruvbox" },
                sections = {
                    lualine_c = {
                        {
                            "filename",
                            path = 4,
                        },
                    },
                },
            })
        end,
    },                                     -- Fancier statusline
    "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "float",
                open_mapping = [[<c-t>]],
            })
        end,
        opts = {
            --[[ things you want to change go here]]
        },
    },
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
    },
    {
        "leoluz/nvim-dap-go",
    },
    "folke/neoconf.nvim",
    "folke/neodev.nvim"
})
