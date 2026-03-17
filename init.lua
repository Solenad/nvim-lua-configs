-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
vim.env.PATH = "C:/Users/Rohann/AppData/Local/Programs/Python/Python312;" .. vim.env.PATH
vim.env.PATH = "C:/Users/Rohann/AppData/Local/Programs/Python/Python312/Scripts;" .. vim.env.PATH
vim.g.python3_host_prog = "C:/Users/Rohann/AppData/Local/Programs/Python/Python312/python.exe"
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")




vim.env.PYTHON = "C:/Users/Rohann/AppData/Local/Programs/Python/Python312/python.exe"
vim.env.PYTHON3 = vim.env.PYTHON
require "lazy_setup"

require "polish"
require "plugins-config.nvim-tree"
require("catppuccin").setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- Keep this true
  show_end_of_buffer = false,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = false,
  no_underline = false,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})


require 'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  }, -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
  -- set the light or dark variant manually, instead of relying on `background`
  -- (default to nil)
  variant = "light|dark",
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore"
    }
  },
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log"
    }
  },
  -- same as `override` but specifically for operating system
  -- takes effect when `strict` is true
  override_by_operating_system = {
    ["apple"] = {
      icon = "",
      color = "#A2AAAD",
      cterm_color = "248",
      name = "Apple",
    },
  },
}


vim.api.nvim_set_hl(0, "Cursor", { bg = "NONE", fg = "NONE" }) -- Cursor highlight itself
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })          -- Cursor line background
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "NONE" })        -- Cursor column background
vim.cmd([[set nocursorline]])
vim.cmd([[set nocursorcolumn]])

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)
lsp.setup()

require("notify").setup({
  background_colour = "#1e222a", -- Replace with a valid color if #000000 is not suitable
})

vim.g.molten_cell_delimiter = "# %%"
vim.keymap.set("v", "<leader>mr", "<Esc><Cmd>MoltenEvaluateVisual<CR>", { desc = "Molten eval visual selection" })
vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Molten eval line" })
vim.keymap.set("n", "<leader>mo", ":MoltenShowOutput<CR>", { desc = "Molten show output" })
vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Molten hide output" })
vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Molten delete cell" })
vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Molten init kernel" })
vim.keymap.set("n", "<leader>mI", ":MoltenDeinit<CR>", { desc = "Molten de-init kernel" })
vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "Molten re-run cell" })
vim.keymap.set("n", "<leader>mD", ":MoltenInterrupt", { desc = "Molten interrupt runtime" })
vim.keymap.set("n", "<leader>mx", ":MoltenOpenInBrowser<CR>", { desc = "Molten open output in browser", silent = true })

-- Default options:


require('livepreview.config').set()




require('kanagawa').setup({
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {             -- add/modify theme and palette colors
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  overrides = function(colors) -- add/modify highlights
    return {}
  end,
  theme = "wave", -- Load "wave" theme when 'background' option is not set
  background = {  -- map the value of 'background' option to a theme
    dark = "wave",
    light = "lotus"
  },
})



require("rose-pine").setup({
  variant = "auto",      -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  enable = {
    terminal = true,
    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    migrations = true,        -- Handle deprecated options automatically
  },

  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },

  groups = {
    border = "muted",
    link = "iris",
    panel = "surface",

    error = "love",
    hint = "iris",
    info = "foam",
    note = "pine",
    todo = "rose",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",
    git_untracked = "subtle",

    h1 = "iris",
    h2 = "foam",
    h3 = "rose",
    h4 = "gold",
    h5 = "pine",
    h6 = "foam",
  },

  palette = {
    -- Override the builtin palette per variant
    -- moon = {
    --     base = '#18191a',
    --     overlay = '#363738',
    -- },
  },

  -- NOTE: Highlight groups are extended (merged) by default. Disable this
  -- per group via `inherit = false`
  highlight_groups = {
    -- Comment = { fg = "foam" },
    -- StatusLine = { fg = "love", bg = "love", blend = 15 },
    -- VertSplit = { fg = "muted", bg = "muted" },
    -- Visual = { fg = "base", bg = "text", inherit = false },
  },

  before_highlight = function(group, highlight, palette)
    -- Disable all undercurls
    -- if highlight.undercurl then
    --     highlight.undercurl = false
    -- end
    --
    -- Change palette colour
    -- if highlight.fg == palette.pine then
    --     highlight.fg = palette.foam
    -- end
  end,
})

-- COLORSCHEMES
-- setup must be called before loading

-- ROSE-PINE
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")

-- KANAGAWA (Dark, Red)
-- vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme catppuccin")

-- TOKYONIGHT
-- vim.cmd("colorscheme tokyonight")
