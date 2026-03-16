return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local install = require("nvim-treesitter.install")
      local parser_install_dir = vim.fn.stdpath("data") .. "/parsers"
      vim.fn.mkdir(parser_install_dir, "p")

      -- must be set before TS install/update actions
      install.parser_install_dir = parser_install_dir

      -- ensure runtimepath includes custom parser dir
      if not vim.tbl_contains(vim.opt.runtimepath:get(), parser_install_dir) then
        vim.opt.runtimepath:append(parser_install_dir)
      end

      opts = opts or {}
      opts.parser_install_dir = parser_install_dir
      opts.ensure_installed = opts.ensure_installed or {}
      return opts
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
