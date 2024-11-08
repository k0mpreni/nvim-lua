return require("lazy").setup({
	"pixelastic/vim-undodir-tree",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			"jonarrien/telescope-cmdline.nvim",
		},
		keys = {
			{ ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
		},
		opts = {
			extensions = {
				cmdline = {},
			},
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("cmdline")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	},
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
			"nvim-treesitter/nvim-treesitter-textobjects", -- "windwp/nvim-ts-autotag",
			-- "windwp/nvim-autopairs",
		},
	}, -- "ggandor/leap.nvim",
	"nvim-treesitter/playground",
	{
		"lukas-reineke/lsp-format.nvim",
		config = function()
			require("lsp-format").setup({})
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
		dependencies = { -- LSP Configuration & Plugins
			"neovim/nvim-lspconfig", -- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim", -- Useful status updates for LSP
			"j-hui/fidget.nvim", -- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim", -- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" }, -- Snippets
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
					"rafamadriz/friendly-snippets",
				},
			},
			{
				"stevearc/conform.nvim",
				opts = {},
			},
			"jose-elias-alvarez/typescript.nvim",
		},
	},
	"posva/vim-vue",
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {},
					lualine_c = { {
						"filename",
						path = 1,
					} },
					-- lualine_x = { "copilot", "filetype" },
					lualine_x = { "filetype" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	}, -- Fancier statusline
	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})
		end,
	},
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{ "leoluz/nvim-dap-go" },
	{
		"stevearc/oil.nvim",
		opts = {
			win_options = {
				signcolumn = "yes:2",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-p>"] = false,
				["<leader>p"] = "actions.preview",
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"refractalize/oil-git-status.nvim",

		dependencies = { "stevearc/oil.nvim" },

		config = true,
	},
	"folke/neoconf.nvim",
	"folke/neodev.nvim",
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	-- cmd = "Copilot",
	-- 	build = ":Copilot auth",
	-- 	opts = {
	-- 		suggestion = { enabled = false },
	-- 		panel = { enabled = false },
	-- 		filetypes = {
	-- 			vue = true,
	-- 			javascript = true,
	-- 			typescript = true,
	-- 			javascriptreact = true,
	-- 			typescriptreact = true,
	-- 			markdown = true,
	-- 			help = true,
	-- 		},
	-- 	},
	-- },
	-- { "AndreM222/copilot-lualine" },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	opts = {},
	-- },
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
	},
})
