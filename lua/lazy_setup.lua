require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^4",                -- Remove version tracking to elect for nightly AstroNvim
    import = "astronvim.plugins",
    opts = {                       -- AstroNvim options must be set here with the `import` key
      mapleader = " ",             -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",",        -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true,        -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil,           -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  { import = "community" },
  { "kyazdani42/nvim-tree.lua", event = "VimEnter",  dependencies = "nvim-tree/nvim-web-devicons" },
  { "catppuccin/nvim",          name = "catppuccin", lazy = false,                                priority = 1001 },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" }
    },
    cmd = { -- Optional: lazy-load only when these commands are used
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },
  {
    "lewis6991/satellite.nvim",
    config = function()
      require('satellite').setup()
    end
  },
  {
    "NStefan002/2048.nvim",
    cmd = "Play2048",
    config = true,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Set a high priority to load this colorscheme first
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- The following are optional:
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    },
    config = true
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'general'
      vim.g.vimtex_view_general_viewer = 'start'
      vim.g.vimtex_view_general_options = ''
      vim.g.maplocalleader = ','
    end,
  },
  {
    "SUSTech-data/neopyter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "AbaoFromCUG/websocket.nvim",
    },
    cmd = { "Neopyter" }, -- load plugin when any :Neopyter command is used
    config = function()
      require("neopyter").setup({
        mode = "direct",
        remote_address = "127.0.0.1:9001",
        file_pattern = { "*.ju.*" },
        on_attach = function(bufnr)
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = bufnr })
          end

          map("n", "<space>K", "<cmd>Neopyter execute notebook:run-cell<cr>", "run selected")
          map("n", "<space>X", "<cmd>Neopyter execute notebook:run-all-above<cr>", "run all above cell")
          map("n", "<space>nt", "<cmd>Neopyter execute kernelmenu:restart<cr>", "restart kernel")
          map("n", "<S-Enter>", "<cmd>Neopyter execute notebook:run-cell-and-select-next<cr>",
            "run selected and select next")
        end,
      })
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },


  { import = "plugins" },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
