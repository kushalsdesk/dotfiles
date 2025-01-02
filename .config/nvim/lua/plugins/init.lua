return {

  -- LSP Configuration
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.lspconfig"
  --   end,
  -- },
  {
    require "configs.mason",
  },

  -- Full Custom Configs
  -- Start-up
  {
    require "configs.greeter",
  },
  -- Auto-session
  {
    require "configs.auto-session",
  },
  -- Auto-Pairs
  {
    require "configs.autopairs",
  },
  -- Telescope Setup
  {
    require "configs.telescope",
  },
  -- Formatter Setup
  {
    require "configs.conform",
  },
  -- Tree-Sitter
  {
    require "configs.treesitter",
  },
  -- LazyGit
  {
    require "configs.lazygit",
  },
  -- -- Notifications
  -- {
  --   require "configs.noice",
  -- },

  --Navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- File manager
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
  },
  -- Dressing  (For Nicer Input Prompt)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  -- For Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    config = function()
      require("render-markdown").setup()
    end,
  },
  -- Todo Comments
  {
    require "configs.todo-comments",
  },
  {
    require "configs.trouble",
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  -- Refactoration
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup {}
    end,
  },
  {
    "jwalton512/vim-blade", -- For Blade syntax highlighting
    lazy = false,
  },
}
