return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "HiPhish/nvim-ts-rainbow2",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    --Initializing TreeSitter
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      ensure_installed = {
        "c",
        "html",
        "javascript",
        "java",
        "json",
        "lua",
        "luadoc",
        "luap",
        "python",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "rust",
        "go",
        "gomod",
        "gowork",
        "gosum",
      },
      autotag = {
        enable = true,
        enable_close = true,
        enable_close_on_slash = true,
        autoclose = true,
        autorename = true
      },
      rainbow = {
        enable = true,
        query = 'rainbow-parens',
        strategy = require 'ts-rainbow.strategy.global',
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      },
      highlight = { enable = true, additional_vim_regex_highlighting = false, },
      indent = { enable = true },
    })
  end
}
