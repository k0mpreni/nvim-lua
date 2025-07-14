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
    dependencies = {                       -- LSP Configuration & Plugins
      "neovim/nvim-lspconfig",             -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", -- Useful status updates for LSP
      "j-hui/fidget.nvim",                 -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",                 -- Autocompletion
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
  },                                     -- Fancier statusline
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
  -- "github/copilot.vim",
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   opts = {
  --     suggestion = { enabled = false },
  --     panel = { enabled = false },
  --     filetypes = {
  --       vue = true,
  --       javascript = true,
  --       typescript = true,
  --       javascriptreact = true,
  --       typescriptreact = true,
  --       markdown = true,
  --       help = true,
  --     },
  --   },
  -- },
  -- { "AndreM222/copilot-lualine" },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   opts = {},
  -- },
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({})
    end,
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   opts = {},
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     auto_suggestions_provider = "gemini",
  --     provider = "gemini",
  --     providers = {
  --
  --       gemini = {
  --         model = "gemini-2.0-flash",
  --       },
  --     },
  --
  --     behaviour = {
  --       auto_suggestions = true, -- Experimental stage
  --       -- auto_set_highlight_group = true,
  --       -- auto_set_keymaps = true,
  --       -- auto_apply_diff_after_generation = false,
  --       -- support_paste_from_clipboard = false,
  --       -- minimize_diff = true,                  -- Whether to remove unchanged lines when applying a code block
  --       -- enable_token_counting = true,          -- Whether to enable token counting. Default to true.
  --       -- auto_approve_tool_permissions = false, -- Default: show permission prompts for all tools
  --       -- Examples:
  --       -- auto_approve_tool_permissions = true,                -- Auto-approve all tools (no prompts)
  --       -- auto_approve_tool_permissions = {"bash", "replace_in_file"}, -- Auto-approve specific tools only
  --     },
  --     -- for example
  --     -- provider = "openai",
  --     -- providers = {
  --     --   openai = {
  --     --     endpoint = "https://api.openai.com/v1",
  --     --     model = "gpt-4o",               -- your desired model (or use gpt-4o, etc.)
  --     --     extra_request_body = {
  --     --       timeout = 30000,              -- Timeout in milliseconds, increase this for reasoning models
  --     --       temperature = 0.75,
  --     --       max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --     --       --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     --     },
  --     --   },
  --     -- },
  --   },
  --   suggestion = {
  --     debounce = 300,
  --     throttle = 300,
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick",         -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",              -- for file_selector provider fzf
  --     "stevearc/dressing.nvim",        -- for input provider dressing
  --     "folke/snacks.nvim",             -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",        -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
})
